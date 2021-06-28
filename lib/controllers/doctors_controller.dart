import 'dart:convert';

import 'package:at_commons/at_commons.dart';
import 'package:at_contact/at_contact.dart';
import 'package:atsign_ecare/services/backend_service.dart';

class DoctorsController {
  DoctorsController._();
  static DoctorsController _instance = DoctorsController._();
  factory DoctorsController() => _instance;
  BackendService _backendService = BackendService.getInstance();
  Map<String, Map<String, dynamic>> doctorTags = {};
  addDoctor(AtContact doctor, Map<String, dynamic> doctorDetails) async {
    doctorTags.putIfAbsent(jsonEncode(doctor), () => doctorDetails);
    AtKey doctorsKey = AtKey()
      ..key = 'doctorDetails'
      ..metadata = Metadata();
    await _backendService.atClientInstance
        .put(doctorsKey, jsonEncode(doctorTags));
  }

  getDoctorsDetails() async {
    AtKey doctorsKey = AtKey()
      ..key = 'doctorDetails'
      ..metadata = Metadata();

    AtValue keyValue = await _backendService.atClientInstance.get(doctorsKey);

    var jsonValue;
    if (keyValue.value != null) {
      jsonValue = jsonDecode(keyValue.value);
      doctorTags = Map.from(jsonValue);
      print('JSON VALUE====>$jsonValue');
    }
  }
}
