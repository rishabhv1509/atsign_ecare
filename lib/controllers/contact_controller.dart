import 'package:at_contacts_flutter/utils/init_contacts_service.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/utils/constants.dart';

class ContactsController {
  ContactsController._();
  static ContactsController _instance = ContactsController._();
  factory ContactsController() => _instance;

  initializeContactService() async {
    BackendService _backendService = BackendService.getInstance();
    var currentAtSign = await _backendService.getAtSign();
    initializeContactsService(
        _backendService.atClientServiceInstance.atClient, currentAtSign,
        rootDomain: MixedConstants.ROOT_DOMAIN);
  }
}
