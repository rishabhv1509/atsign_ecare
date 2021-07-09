import 'package:atsign_ecare/models/patient.dart';

class Bookings {
  final Patient patient;
  final DateTime date;
  final String timeSlot;

  Bookings({
    this.patient,
    this.date,
    this.timeSlot,
  });

  Map<String, dynamic> toJson() => {
        'doctor': patient.toJson(),
        'date': date.toIso8601String(),
        'timeSlot': timeSlot,
      };

  Bookings.fromJson(Map<String, dynamic> json)
      : patient = Patient.fromJson(json['patient']),
        date = DateTime.parse(json['date']),
        timeSlot = json['timeSlot'];
}
