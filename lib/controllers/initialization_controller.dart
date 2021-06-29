import 'package:at_chat_flutter/at_chat_flutter.dart';
import 'package:at_contacts_flutter/at_contacts_flutter.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/utils/constants.dart';

class Initializations {
  Initializations._();
  static final Initializations _instance = Initializations._();
  factory Initializations() => _instance;
  BackendService _backendService = BackendService.getInstance();
  initializeChat() async {
    var currentAtSign = await _backendService.getAtSign();
    initializeChatService(_backendService.atClientInstance, currentAtSign,
        rootDomain: MixedConstants.ROOT_DOMAIN);
  }

  initializeContactService() async {
    var currentAtSign = await _backendService.getAtSign();
    initializeContactsService(
        _backendService.atClientServiceInstance.atClient, currentAtSign,
        rootDomain: MixedConstants.ROOT_DOMAIN);
  }
}
