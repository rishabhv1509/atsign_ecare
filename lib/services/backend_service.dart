import 'dart:async';
import 'dart:io';

// ignore: implementation_imports
import 'package:at_chat_flutter/at_chat_flutter.dart';
import 'package:at_client/src/manager/sync_manager.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:at_commons/at_commons.dart';
import 'package:at_contacts_flutter/utils/init_contacts_service.dart';
import 'package:at_lookup/at_lookup.dart';
import 'package:at_onboarding_flutter/screens/onboarding_widget.dart';
import 'package:atsign_ecare/controllers/initialization_controller.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'navigation_service.dart';

class BackendService {
  static final BackendService _singleton = BackendService._internal();
  BackendService._internal();

  factory BackendService.getInstance() {
    return _singleton;
  }
  AtClientService atClientServiceInstance;
  AtClientImpl atClientInstance;
  String currentAtSign;

  // ignore: non_constant_identifier_names
  String app_lifecycle_state;
  AtClientPreference atClientPreference;
  bool autoAcceptFiles = false;
  // ignore: non_constant_identifier_names
  final String AUTH_SUCCESS = "Authentication successful";
  String get currentAtsign => currentAtSign;

  // ignore: close_sinks
  final _isAuthuneticatingStreamController = StreamController<bool>.broadcast();
  Stream<bool> get isAuthuneticatingStream =>
      _isAuthuneticatingStreamController.stream;
  StreamSink<bool> get isAuthuneticatingSink =>
      _isAuthuneticatingStreamController.sink;
  Directory downloadDirectory;
  Future<AtClientPreference> getAtClientPreference() async {
    if (Platform.isIOS) {
      downloadDirectory =
          await path_provider.getApplicationDocumentsDirectory();
    } else {
      downloadDirectory = await path_provider.getExternalStorageDirectory();
    }
    final appDocumentDirectory =
        await path_provider.getApplicationSupportDirectory();
    String path = appDocumentDirectory.path;
    var _atClientPreference = AtClientPreference()
      ..isLocalStoreRequired = true
      ..downloadPath = downloadDirectory.path
      ..commitLogPath = path
      ..namespace = MixedConstants.appNamespace
      ..syncStrategy = SyncStrategy.IMMEDIATE
      ..rootDomain = MixedConstants.ROOT_DOMAIN
      ..syncRegex = MixedConstants.regex
      ..hiveStoragePath = path;

    return _atClientPreference;
  }

  // QR code scan
  Future authenticate(String qrCodeString, BuildContext context) async {
    Completer c = Completer();
    if (qrCodeString.contains('@')) {
      try {
        List<String> params = qrCodeString.split(':');
        if (params?.length == 2) {
          await authenticateWithCram(params[0], cramSecret: params[1]);
          currentAtSign = params[0];
          await startMonitor();
          c.complete(AUTH_SUCCESS);
          await Navigator.pushNamed(context, Routes.PRIVATE_KEY_GEN_SCREEN);
        }
      } catch (e) {
        print("error here =>  ${e.toString()}");
        c.complete('Fail to Authenticate');
        print(e);
      }
    } else {
      // wrong bar code
      c.complete("incorrect QR code");
      print("incorrect QR code");
    }
    return c.future;
  }

  // first time setup with cram authentication
  Future<bool> authenticateWithCram(String atsign, {String cramSecret}) async {
    atClientPreference.cramSecret = cramSecret;
    var result =
        await atClientServiceInstance.authenticate(atsign, atClientPreference);
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }

  Future<bool> authenticateWithAESKey(String atsign,
      {String cramSecret, String jsonData, String decryptKey}) async {
    atClientPreference.cramSecret = cramSecret;
    var result = await atClientServiceInstance.authenticate(
        atsign, atClientPreference,
        jsonData: jsonData, decryptKey: decryptKey);
    atClientInstance = atClientServiceInstance.atClient;
    currentAtSign = atsign;
    return result;
  }

  ///Fetches atsign from device keychain.
  Future<String> getAtSign() async {
    // return await atClientServiceInstance.getAtSign();
    await getAtClientPreference().then((value) {
      return atClientPreference = value;
    });

    atClientServiceInstance = AtClientService();

    return await atClientServiceInstance.getAtSign();
  }

  ///Fetches privatekey for [atsign] from device keychain.
  Future<String> getPrivateKey(String atsign) async {
    return await atClientServiceInstance.getPrivateKey(atsign);
  }

  ///Fetches publickey for [atsign] from device keychain.
  Future<String> getPublicKey(String atsign) async {
    return await atClientServiceInstance.getPublicKey(atsign);
  }

  Future<String> getAESKey(String atsign) async {
    return await atClientServiceInstance.getAESKey(atsign);
  }

  Future<Map<String, String>> getEncryptedKeys(String atsign) async {
    return await atClientServiceInstance.getEncryptedKeys(atsign);
  }

  Map<String, AtClientService> atClientServiceMap = {};
  // startMonitor needs to be called at the beginning of session
  // called again if outbound connection is dropped
  Future<bool> startMonitor({value, atsign}) async {
    if (value.containsKey(atsign)) {
      currentAtSign = atsign;
      atClientServiceMap = value;
      atClientInstance = value[atsign].atClient;
      atClientServiceInstance = value[atsign];
    }

    await atClientServiceMap[atsign].makeAtSignPrimary(atsign);

    String privateKey = await getPrivateKey(atsign);

    atClientInstance.startMonitor(privateKey, _notificationCallBack);
    print('monitor started');

    return true;
  }

  var fileLength;
  var userResponse = false;
  Future<void> _notificationCallBack(var response) async {
    print('response => notif callback');
    // await syncWithSecondary();
    // response = response.replaceFirst('notification:', '');
    // var responseJson = jsonDecode(response);
    // var notificationKey = responseJson['key'];
    // var fromAtSign = responseJson['from'];
    // var toAtSing = responseJson['to'];
    // // var id = responseJson['id'];
    // var atKey = notificationKey.split(':')[1];
    // atKey = atKey.replaceFirst(fromAtSign, '');
    // atKey = atKey.trim();
    // print('fromAtSign : $fromAtSign');

    // // check for notification from blocked atsign
    // if (ContactService()
    //         .blockContactList
    //         .indexWhere((element) => element.atSign == fromAtSign) >
    //     -1) {
    //   return;
    // }

    // if (atKey == 'stream_id') {
    //   var valueObject = responseJson['value'];
    //   var streamId = valueObject.split(':')[0];
    //   var fileName = valueObject.split(':')[1];
    //   fileLength = valueObject.split(':')[2];
    //   fileName = utf8.decode(base64.decode(fileName));
    //   userResponse =
    //       await acceptStream(fromAtSign, fileName, fileLength, toAtSing);

    //   if (userResponse == true) {
    //     await atClientInstance.sendStreamAck(
    //         streamId,
    //         fileName,
    //         int.parse(fileLength),
    //         fromAtSign,
    //         _streamCompletionCallBack,
    //         _streamReceiveCallBack);
    //   }
    //   return;
    // }
  }

  syncWithSecondary() async {
    try {
      SyncManager syncManager = atClientInstance.getSyncManager();
      var isSynced = await syncManager.isInSync();
      print('already synced: $isSynced');
      if (isSynced is bool && isSynced) {
      } else {
        await syncManager.sync();
      }
      print('sync done');
    } catch (e) {
      print('error in sync: $e');
    }
  }

  // acknowledge file transfer

  static final KeyChainManager _keyChainManager = KeyChainManager.getInstance();
  Future<List<String>> getAtsignList() async {
    var atSignsList = await _keyChainManager.getAtSignListFromKeychain();
    return atSignsList;
  }

  deleteAtSignFromKeyChain(String atsign) async {
    List<String> atSignList = await getAtsignList();

    await atClientServiceMap[atsign].deleteAtSignFromKeychain(atsign);

    if (atSignList != null) {
      atSignList.removeWhere((element) => element == currentAtSign);
    }

    var atClientPrefernce;
    await getAtClientPreference().then((value) => atClientPrefernce = value);
    var tempAtsign;
    if (atSignList == null || atSignList.isEmpty) {
      tempAtsign = '';
    } else {
      tempAtsign = atSignList.first;
    }

    if (tempAtsign == '') {
      await Navigator.pushNamedAndRemoveUntil(NavService.navKey.currentContext,
          Routes.HOME, (Route<dynamic> route) => false);
    } else {
      Onboarding(
        atsign: tempAtsign,
        context: NavService.navKey.currentContext,
        atClientPreference: atClientPrefernce,
        domain: MixedConstants.ROOT_DOMAIN,
        appColor: Color.fromARGB(255, 240, 94, 62),
        onboard: (value, atsign) async {
          atClientServiceMap = value;

          String atSign = atClientServiceMap[atsign].atClient.currentAtSign;

          await atClientServiceMap[atSign].makeAtSignPrimary(atSign);
          await startMonitor(atsign: atsign, value: value);
          initializeContactsService(atClientInstance, currentAtSign);
          initializeChatService(atClientInstance, currentAtSign);
          // await onboard(atsign: atsign, atClientPreference: atClientPreference, atClientServiceInstance: );
          await Navigator.pushNamedAndRemoveUntil(
              NavService.navKey.currentContext,
              Routes.HOME,
              (Route<dynamic> route) => false);
        },
        onError: (error) {
          print('Onboarding throws $error error');
        },
        // nextScreen: WelcomeScreen(),
      );
    }
    // if (atClientInstance != null) {
    //   await startMonitor();
    // }
  }

  Future<bool> checkAtsign(String atSign) async {
    if (atSign == null) {
      return false;
    } else if (!atSign.contains('@')) {
      atSign = '@' + atSign;
    }
    var checkPresence = await AtLookupImpl.findSecondary(
        atSign, MixedConstants.ROOT_DOMAIN, AtClientPreference().rootPort);
    return checkPresence != null;
  }

  Future<Map<String, dynamic>> getContactDetails(String atSign) async {
    Map<String, dynamic> contactDetails = {};
    if (atSign == null) {
      return contactDetails;
    } else if (!atSign.contains('@')) {
      atSign = '@' + atSign;
    }
    var metadata = Metadata();
    metadata.isPublic = true;
    metadata.namespaceAware = false;
    AtKey key = AtKey();
    key.sharedBy = atSign;
    key.metadata = metadata;
    List contactFields = [];
    // List contactFields = TextStrings().contactFields;

    try {
      // firstname
      key.key = contactFields[0];
      var result = await atClientInstance
          .get(key)
          // ignore: invalid_return_type_for_catch_error
          .catchError((e) => print("error in get ${e.toString()}"));
      var firstname = result.value;

      // lastname
      key.key = contactFields[1];
      result = await atClientInstance.get(key);
      var lastname = result.value;

      var name = ((firstname ?? '') + ' ' + (lastname ?? '')).trim();
      if (name.fileLength == 0) {
        name = atSign.substring(1);
      }

      // image
      key.metadata.isBinary = true;
      key.key = contactFields[2];
      result = await atClientInstance.get(key);
      var image = result.value;
      contactDetails['name'] = name;
      contactDetails['image'] = image;
    } catch (e) {
      contactDetails['name'] = null;
      contactDetails['image'] = null;
    }
    return contactDetails;
  }

  bool authenticating = false;

  checkToOnboard({String atSign}) async {
    try {
      print('atsign====>$atSign');
      authenticating = true;
      isAuthuneticatingSink.add(authenticating);
      var atClientPrefernce;
      //  await getAtClientPreference();
      await getAtClientPreference()
          .then((value) => atClientPrefernce = value)
          // ignore: invalid_return_type_for_catch_error
          .catchError((e) => print(e));
      Onboarding(
        atsign: atSign,
        context: NavService.navKey.currentContext,
        atClientPreference: atClientPrefernce,
        domain: MixedConstants.ROOT_DOMAIN,
        appColor: Color.fromARGB(255, 240, 94, 62),
        onboard: (value, atsign) async {
          authenticating = true;
          isAuthuneticatingSink.add(authenticating);
          atClientServiceMap = value;

          String atSign = atClientServiceMap[atsign].atClient.currentAtSign;
          currentAtSign = atSign;

          await atClientServiceMap[atSign].makeAtSignPrimary(atSign);
          await startMonitor(atsign: atsign, value: value);

          // _initBackendService();
          // initializeContactsService(atClientInstance, currentAtSign);
          authenticating = false;
          isAuthuneticatingSink.add(authenticating);
          // await onboard(atsign: atsign, atClientPreference: atClientPreference, atClientServiceInstance: );
          await Navigator.pushNamedAndRemoveUntil(
              NavService.navKey.currentContext,
              Routes.DOCTORHOME,
              (Route<dynamic> route) => false);
        },
        onError: (error) {
          print('Onboarding throws $error error');
          authenticating = false;
          isAuthuneticatingSink.add(authenticating);
        },
        // nextScreen: WelcomeScreen(),
      );
      authenticating = false;
      isAuthuneticatingSink.add(authenticating);
    } catch (e) {
      authenticating = false;
      isAuthuneticatingSink.add(authenticating);
    }
  }

  String state;
  // NotificationService _notificationService;
  void _initBackendService() async {
    // _notificationService = NotificationService();
    // _notificationService.cancelNotifications();
    // _notificationService.setOnNotificationClick(onNotificationClick);

    SystemChannels.lifecycle.setMessageHandler((msg) {
      print('set message handler');
      state = msg;
      debugPrint('SystemChannels> $msg');
      app_lifecycle_state = msg;

      return null;
    });
  }

  onNotificationClick(String payload) async {
    // await Navigator.push(
    //   NavService.navKey.currentContext,
    //   MaterialPageRoute(builder: (context) => HistoryScreen(tabIndex: 1)),
    // );
  }
}
