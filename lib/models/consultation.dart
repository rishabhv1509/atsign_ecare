import 'package:atsign_ecare/models/doctor.dart';

class Consultation {
  final Doctor doctor;
  final DateTime date;
  final String timeSlot;

  Consultation({
    this.doctor,
    this.date,
    this.timeSlot,
  });

  Map<String, dynamic> toJson() => {
        'doctor': doctor.toJson(),
        'date': date.toIso8601String(),
        'timeSlot': timeSlot,
      };

  Consultation.fromJson(Map<String, dynamic> json)
      : doctor = Doctor.fromJson(json['doctor']),
        date = DateTime.parse(json['date']),
        timeSlot = json['timeSlot'];
}
