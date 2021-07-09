import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/models/patient.dart';

class Prescription {
  List<dynamic> tests;
  List<Medicines> medicines;
  String content;
  DateTime date;
  Doctor doctor;
  Patient patient;

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
        "medicines": medicines.map((med) => med.toJson()).toList(),
        "date": date.toIso8601String(),
        "content": content,
        "doctor": doctor.toJson(),
        "patient": patient.toJson(),
      };

  Prescription.fromJson(Map<String, dynamic> json) {
    medicines = [];
    tests = json['tests'];
    json['medicines'].forEach((med) {
      medicines.add(Medicines.fromJson(med));
    });
    content = json['content'];
    date = DateTime.parse(json['date']);
    doctor = Doctor.fromJson(json['doctor']);
    patient = Patient.fromJson(json['patient']);
  }
}
