import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/models/patient.dart';
import 'package:atsign_ecare/models/prescription.dart';

class MixedConstants {
  static const String WEBSITE_URL = 'https://atsign.com/';

  // for local server
  // static const String ROOT_DOMAIN = 'vip.ve.atsign.zone';

  // for staging server
  // static const String ROOT_DOMAIN = 'root.atsign.wtf';
  // for production server
  static const String ROOT_DOMAIN = 'root.atsign.org';

  static const int ROOT_PORT = 64;

  static const String TERMS_CONDITIONS = 'https://atsign.com/terms-conditions/';

  static const String FILEBIN_URL = 'https://filebin2.aws.atsign.cloud/';
  // static const String PRIVACY_POLICY = 'https://atsign.com/privacy-policy/';
  static const String PRIVACY_POLICY =
      "https://atsign.com/apps/atmosphere/atmosphere-privacy/";

  static String appNamespace = 'atSignEcare';
  static String regex = '.$appNamespace@';

  static List<Prescription> prescriptionData = [
    Prescription(
      tests: ["Blood Sugar Test", "CT Scan"],
      medicines: [
        Medicines(
          name: "Paracetamol",
          time: "Morning, Evening",
          interval: "Daily",
        ),
        Medicines(
          name: "Banadryl",
          time: "Evening",
          interval: "Daily",
        )
      ],
      date: DateTime.now(),
      content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      doctor: Doctor(
        name: "Dr. John Wick",
        hospital: "Shalby Hospital",
        address: "Baltimore, MD",
        phoneNumber: "(+91) 982428 80752",
        email: "john@wick.com",
        speciality: "M.B.B.S MD(Ortho)",
      ),
      patient: Patient(
        age: "38",
        email: "viral.sangani2011@gmail.com",
        gender: "Male",
        name: "Viral Sangani",
        phoneNumber: "(+91) 98242 80752",
      ),
    ),
    Prescription(
      tests: ["Full Body Scan", "Urine Test"],
      medicines: [
        Medicines(
          name: "Vicodin",
          time: "Afternoon",
          interval: "Daily",
        ),
        Medicines(
          name: "Amoxil",
          time: "Morning",
          interval: "Daily",
        )
      ],
      date: DateTime.now(),
      content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. eiusmod tempor incididunt ut labore et dolore magna aliqua",
      doctor: Doctor(
        name: "Dr. Steven Strange",
        hospital: "Cleveland Clinic",
        address: "Cleveland, OH",
        phoneNumber: "(+91) 98245 26562",
        email: "doctor@strange.com",
        speciality: "M.B.B.S MD(Ortho)",
      ),
      patient: Patient(
        age: "38",
        email: "viral.sangani2011@gmail.com",
        gender: "Male",
        name: "Viral Sangani",
        phoneNumber: "(+91) 98242 80752",
      ),
    )
  ];
}
