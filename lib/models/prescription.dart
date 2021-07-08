import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/models/patient.dart';

class Prescription {
  final List<String> tests;
  final List<Medicines> medicines;
  final String content;
  final DateTime date;
  final Doctor doctor;
  final Patient patient;

  Prescription({
    this.tests,
    this.medicines,
    this.content,
    this.date,
    this.doctor,
    this.patient,
  });
}
