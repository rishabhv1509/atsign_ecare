import 'dart:convert';

import 'package:at_commons/at_commons.dart';
import 'package:at_contact/at_contact.dart';
import 'package:atsign_ecare/services/backend_service.dart';

class PatientsController {
  PatientsController._();
  static PatientsController _instance = PatientsController._();
  factory PatientsController() => _instance;
  BackendService _backendService = BackendService.getInstance();
  Map<String, Map<String, dynamic>> patientTags = {};
  addDoctor(AtContact patient, Map<String, dynamic> patientDetails) async {
    patientTags.putIfAbsent(jsonEncode(patient), () => patientDetails);
    AtKey doctorsKey = AtKey()
      ..key = 'patientDetails'
      ..metadata = Metadata();
    await _backendService.atClientInstance
        .put(doctorsKey, jsonEncode(patientTags));
  }

  getDoctorsDetails() async {
    AtKey doctorsKey = AtKey()
      ..key = 'patientDetails'
      ..metadata = Metadata();

    AtValue keyValue = await _backendService.atClientInstance.get(doctorsKey);

    var jsonValue;
    if (keyValue.value != null) {
      jsonValue = jsonDecode(keyValue.value);
      patientTags = Map.from(jsonValue);
      print('JSON VALUE====>$jsonValue');
    }
  }
}
