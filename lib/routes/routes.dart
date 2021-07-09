import 'package:at_contacts_flutter/screens/contacts_screen.dart';
import 'package:at_onboarding_flutter/screens/private_key_qrcode_generator.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/account/account_screen.dart';
import 'package:atsign_ecare/screens/account/booking_history.dart';
import 'package:atsign_ecare/screens/account/change_password.dart';
import 'package:atsign_ecare/screens/account/prescription.dart';
import 'package:atsign_ecare/screens/account/reports.dart';
import 'package:atsign_ecare/screens/consultation/consultation.dart';
import 'package:atsign_ecare/screens/consultation/consultation_four.dart';
import 'package:atsign_ecare/screens/consultation/consultation_three.dart';
import 'package:atsign_ecare/screens/consultation/consultation_two.dart';
import 'package:atsign_ecare/screens/doctor/bookings/bookings.dart';
import 'package:atsign_ecare/screens/doctor/home/doctor_home_screen.dart';
import 'package:atsign_ecare/screens/doctor/message/chat.dart';
import 'package:atsign_ecare/screens/doctor/message/patient_list.dart';
import 'package:atsign_ecare/screens/doctor/profile/doctor_profile.dart';
import 'package:atsign_ecare/screens/doctor/profile/editprofilescreen.dart';
import 'package:atsign_ecare/screens/doctor/total_consultation/total_consultation_screen.dart';
import 'package:atsign_ecare/screens/onboarding/authentication_screen.dart';
import 'package:atsign_ecare/screens/onboarding/signup_doctor.dart';
import 'package:atsign_ecare/screens/onboarding/signup_doctor_three.dart';
import 'package:atsign_ecare/screens/onboarding/signup_doctor_two.dart';
import 'package:atsign_ecare/screens/onboarding/signup_patient.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_login.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_signup.dart';
import 'package:atsign_ecare/screens/patient/ai_analysis/ai_analysis.dart';
import 'package:atsign_ecare/screens/patient/ai_analysis/ai_analysis_result.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/book_appointment.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/choose_doctor.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/doctor_profile.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/make_payment.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/payment.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/payment_completed.dart';
import 'package:atsign_ecare/screens/patient/health_checkup/book_diagnostic-center.dart';
import 'package:atsign_ecare/screens/patient/health_checkup/diagnostic_center.dart';
import 'package:atsign_ecare/screens/patient/health_checkup/diagnostic_confirm_booking.dart';
import 'package:atsign_ecare/screens/patient/health_checkup/health_checkup.dart';
import 'package:atsign_ecare/screens/patient/home/home_screen.dart';
import 'package:atsign_ecare/screens/patient/home/search_result.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/chat.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/feedback.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/myconsultation.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/video_call/video_call.dart';
import 'package:atsign_ecare/screens/patient/my_prescriptions/my_prescriptions.dart';
import 'package:atsign_ecare/screens/patient/notifications/medication_reminders.dart';
import 'package:atsign_ecare/screens/patient/specialities/doctors_list.dart';
import 'package:atsign_ecare/screens/patient/specialities/specialities.dart';
import 'package:atsign_ecare/screens/patient/symptoms/symptoms.dart';
import 'package:atsign_ecare/screens/splash_screen.dart';
import 'package:atsign_ecare/screens/welcome_screen/welcome_screen.dart';
import 'package:atsign_ecare/services/navigation_service.dart';
import 'package:flutter/material.dart';

class SetupRoutes {
  static String initialRoute = Routes.HOMESCREEN;

  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.WELCOME_SCREEN: (context) => WelcomeScreen(),
      Routes.WELCOMESCREEN: (_) => WelcomeScreen(),
      Routes.SPLASHSCREEN: (_) => SplashScreen(),
      Routes.SIGNUPSCREEN: (_) => AuthenticationScreen(),
      Routes.SIGNUPSCREENPATIENT: (_) => SignUpScreenPatient(),
      Routes.SIGNUPSCREENDOCTOR: (_) => SignUpScreenDoctor(),
      Routes.SIGNUPSCREENDOCTORTWO: (_) => SignUpScreenDoctorTwo(),
      Routes.SIGNUPSCREENDOCTORTHREE: (_) => SignUpScreenDoctorThree(),
      Routes.CONTACT_SCREEN: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return ContactsScreen(
            asSelectionScreen: args['asSelectionScreen'],
            context: NavService.navKey.currentContext,
            selectedList: args['selectedList']);
      },
      Routes.PRIVATE_KEY_GEN_SCREEN: (context) => PrivateKeyQRCodeGenScreen(),
      Routes.MEDICATIONREMINDERS: (context) => MedicationReminders(),
      Routes.LOGINOTPVERIFICATION: (_) => LoginOtpVerification(),
      Routes.SIGNUPOTPVERIFICATION: (_) => SignUpOtpVerification(),

      // Patient Routes
      Routes.HOMESCREEN: (_) => HomeScreen(),
      Routes.AIANALYSISSCREEN: (_) => AiAnalysisScreen(),
      Routes.AIANALYSISSCREENRESULT: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return AiAnalysisResultScreen(data: args['data']);
      },
      Routes.MYPRESCRIPTIONS: (_) => MyPrescriptions(),
      Routes.MYCONSULTATION: (context) => MyConsultation(),
      Routes.CONSULTATION: (_) => Consultation(),
      Routes.SEARCHRESULT: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return SearchResult(searchString: args['searchString']);
      },
      Routes.CONSULTATIONTWO: (_) => ConsultationTwo(),
      Routes.CONSULTATIONTHREE: (_) => ConsultationThree(),
      Routes.CONSULTATIONFOUR: (_) => ConsultationFour(),
      Routes.CHOOSEDOCTOR: (_) => ChooseDoctor(),
      Routes.DOCTORPROFILE: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return DoctorProfile(doctor: args['doctor']);
      },
      Routes.BOOKAPPOINTMENT: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return BookAppointment(doctor: args['doctor']);
      },
      Routes.SYMPTOMS: (_) => Symptoms(),
      Routes.MAKEPAYMENTS: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return MakePayment(consultation: args['consultation']);
      },
      Routes.PAYMENT: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return Payment(consultation: args['consultation']);
      },
      Routes.PAYMENTCOMPLETED: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return PaymentCompleted(consultation: args['consultation']);
      },
      Routes.PROfILE: (_) => AccountScreen(),
      Routes.BOOKINGHISTORY: (_) => BookingHistory(),
      Routes.REPORTS: (_) => Reports(),
      Routes.PRESCRIPTION: (_) => Prescription(),
      Routes.CHANGEPASSWORD: (_) => ChangePassword(),
      Routes.CHAT: (_) {
        Map<String, dynamic> args =
            ModalRoute.of(_).settings.arguments as Map<String, dynamic>;
        return Chat(chatWith: args['chatWith']);
      },
      Routes.VIDEOCALL: (_) => VideoCall(),
      Routes.FEEDBACK: (_) => FeedbackScreen(),
      Routes.HEALTHCHECKUP: (_) => HealthCheckup(),
      Routes.SPECIALITIES: (_) => Specialities(),
      Routes.DOCTORSLIST: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return DoctorsList(speciality: args['speciality']);
      },
      Routes.DIAGNOSTICCENTER: (_) => DiagnosticCenter(),
      Routes.BOOKDIAGNOSTICCENTER: (_) => BookDiagnosticCenter(),
      Routes.DIAGNOSTICCONFIRMBOOKING: (_) => DiagnosticConfirmBooking(),

      // Doctor Routes
      Routes.DOCTORHOME: (_) => DoctorHomeScreen(),
      Routes.DOCTORPROFILESCREEN: (_) => DoctorProfileScreen(),
      Routes.EDITDOCTORPROFILE: (_) => EditDoctorProfile(),
      Routes.TOTALCONSULTATION: (_) => TotalConsulationScreen(),
      Routes.DOCTORCHAT: (_) => DoctorChat(),
      Routes.PATIENTLIST: (_) => PatientList(),
      Routes.BOOKINGS: (_) => Bookings(),
    };
  }
}
