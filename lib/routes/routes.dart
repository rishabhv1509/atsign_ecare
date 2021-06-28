// import 'package:at_contacts_group_flutter/screens/group_contact_view/group_contact_view.dart';
import 'package:at_onboarding_flutter/screens/private_key_qrcode_generator.dart';
import 'package:atsign_ecare/config/image_constants.dart';
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
import 'package:atsign_ecare/screens/doctor/home/doctor_home_screen.dart';
import 'package:atsign_ecare/screens/doctor/profile/doctor_profile.dart';
import 'package:atsign_ecare/screens/doctor/profile/editprofilescreen.dart';
import 'package:atsign_ecare/screens/doctor/total_consultation/total_consultation_screen.dart';
import 'package:atsign_ecare/screens/onboarding/authentication_screen.dart';
import 'package:atsign_ecare/screens/onboarding/signup_screen.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_login.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_signup.dart';
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
import 'package:atsign_ecare/screens/patient/my_consultation/chat/chat.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/feedback.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/myconsultation.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/video_call/video_call.dart';
import 'package:atsign_ecare/screens/patient/specialities/gynecologist.dart';
import 'package:atsign_ecare/screens/patient/specialities/specialities.dart';
import 'package:atsign_ecare/screens/patient/symptoms/symptoms.dart';
import 'package:atsign_ecare/screens/splash_screen.dart';
import 'package:atsign_ecare/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class SetupRoutes {
  static String initialRoute = Routes.HOMESCREEN;

  static Map<String, WidgetBuilder> get routes {
    return {
      // Routes.HOME: (context) => Home(),
      Routes.SPLASHSCREEN: (_) => SplashScreen(),
      Routes.SINGUPSCREEN: (_) => SignUpForm(),
      Routes.WELCOME_SCREEN: (context) => WelcomeScreen(),
      Routes.PRIVATE_KEY_GEN_SCREEN: (context) => PrivateKeyQRCodeGenScreen(),
      Routes.SIGNUPOTPVERIFICATION: (_) => SignUpOtpVerification(),
      Routes.LOGINOTPVERIFICATION: (_) => LoginOtpVerification(),
      Routes.MYCONSULTATION: (_) => MyConsultation(),
      Routes.WELCOMESCREEN: (_) => WelcomeScreen(),
      Routes.HOMESCREEN: (_) => HomeScreen(),
      Routes.DOCTORHOME: (_) => DoctorHomeScreen(),
      Routes.CONSULTATION: (_) => Consultation(),
      Routes.CONSULTATIONTWO: (_) => ConsultationTwo(),
      Routes.CONSULTATIONTHREE: (_) => ConsultationThree(),
      Routes.CONSULTATIONFOUR: (_) => ConsultationFour(),
      Routes.CHOOSEDOCTOR: (_) => ChooseDoctor(),
      Routes.DOCTORPROFILESCREEN: (_) => DoctorProfileScreen(),
      Routes.EDITDOCTORPROFILE: (_) => EditDoctorProfile(),
      Routes.DOCTORPROFILE: (_) => DoctorProfile(
            specialistImage: AllImages().specialistImage,
            specialistName: 'Robert Kilm',
            specialistDesignation: 'MD, Neurology',
            specialistDescription:
                'Experienced leader in\ntreatment of neuromuscular',
            specialistCharge: '\$230',
            specialistRating: '3.0',
          ),
      Routes.BOOKAPPOINTMENT: (_) => BookAppointment(),
      Routes.SYMPTOMS: (_) => Symptoms(),
      Routes.MAKEPAYMENTS: (_) => MakePayment(),
      Routes.PAYMENT: (_) => Payment(),
      Routes.PAYMENTCOMPLETED: (_) => PaymentCompleted(),
      Routes.PROfILE: (_) => AccountScreen(),
      Routes.BOOKINGHISTORY: (_) => BookingHistory(),
      Routes.REPORTS: (_) => Reports(),
      Routes.PRESCRIPTION: (_) => Prescription(),
      Routes.CHANGEPASSWORD: (_) => ChangePassword(),
      Routes.CHAT: (_) => ChatScreen(),
      Routes.VIDEOCALL: (_) => VideoCall(),
      Routes.FEEDBACK: (_) => FeedbackScreen(),
      Routes.HEALTHCHECKUP: (_) => HealthCheckup(),
      Routes.SPECIALITIES: (_) => Specialities(),
      Routes.GYNOCOLOGIST: (_) => Gynecologist(),
      Routes.DIAGNOSTICCENTER: (_) => DiagnosticCenter(),
      Routes.BOOKDIAGNOSTICCENTER: (_) => BookDiagnosticCenter(),
      Routes.DIAGNOSTICCONFIRMBOOKING: (_) => DiagnosticConfirmBooking(),
      Routes.AUTH: (_) => AuthenticationScreen(),
      Routes.TOTALCONSULTATION: (_) => TotalConsulationScreen(),
    };
  }
}
