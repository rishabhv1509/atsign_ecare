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

  Map<String, dynamic> toJson() => {
        "tests": tests,
        "medicines": medicines.map((med) => med.toJson()),
        "content": content,
        "date": date,
        "doctor": doctor.toJson(),
        "patient": patient.toJson(),
      };

  Prescription.fromJson(Map<String, dynamic> json)
      : tests = json['tests'],
        medicines = json['medicines'].map((med) => Medicines.fromJson(med)),
        content = json['content'],
        date = json['date'],
        doctor = Doctor.fromJson(json['doctor']),
        patient = Patient.fromJson(json['patient']);
}
