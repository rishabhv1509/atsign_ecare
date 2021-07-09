import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static Future<void> setData(String title, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(title, data);
  }

  static Future<String> getData(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(title) ?? "";
  }

  static Future<void> deleteData(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(title);
  }
}

class SharedPrefConstant {
  static const String PatientData = "patient_data";
  static const String DoctorData = "doctor_data";
  static const String Consultation = "consultation";
  static const String Prescription = "prescription";
}
