import 'package:atsign_ecare/models/bookings.dart';
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

  static List<Doctor> doctors = [
    Doctor(
      name: "Dr. Justin Bax",
      hospital: "Shalby Hospital",
      address: "3147 Broadway Avenue",
      phoneNumber: "989-620-1859",
      email: "damr.loka2@mservices.life",
      speciality: "Gynecologist",
      profileImagePath: "https://randomuser.me/api/portraits/men/43.jpg",
      profileDetails:
          "As the asteroid hurtled toward earth, Becky was upset her dentist appointment had been canceled.",
      pricePerHour: 200,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
    Doctor(
      name: "Dr. John Wick",
      hospital: "Enlarge Hospital",
      address: "332 Dye Street",
      phoneNumber: "989-710-9022",
      email: "2chri@greendike.com",
      speciality: "Physician",
      profileImagePath: "https://randomuser.me/api/portraits/men/32.jpg",
      profileDetails:
          "A suit of armor provides excellent sun protection on hot days.",
      pricePerHour: 150,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
    Doctor(
      name: "Dr. Kathy M Waugh",
      hospital: "Diagram Hospital",
      address: "2877 Green Street",
      phoneNumber: "318-623-9812",
      email: "fjean.fedelho.187@monsait.com",
      speciality: "Orthopedician",
      profileImagePath: "https://randomuser.me/api/portraits/women/80.jpg",
      profileDetails:
          "The gruff old man sat in the back of the bait shop grumbling to himself as he scooped out a handful of worms.",
      pricePerHour: 300,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
    Doctor(
      name: "Dr. Anita J Barton",
      hospital: "Reserve Hospital",
      address: "3680 Wyatt Street",
      phoneNumber: "318-392-9282",
      email: "3dhionathanm7@btcmod.com",
      speciality: "Dietitian",
      profileImagePath: "https://randomuser.me/api/portraits/men/37.jpg",
      profileDetails:
          "He decided water-skiing on a frozen lake wasn’t a good idea.",
      pricePerHour: 179,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
    Doctor(
      name: "Dr. Jessica H Johns",
      hospital: "Fantasy Hospital",
      address: "4175 Layman Avenue",
      phoneNumber: "410-303-4022",
      email: "1ammar.has@googl.win",
      speciality: "Children's health",
      profileImagePath: "https://randomuser.me/api/portraits/women/26.jpg",
      profileDetails: "",
      pricePerHour: 220,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
    Doctor(
      name: "Dr. Elsie L Shook",
      hospital: "Recruit Hospital",
      address: "1611 Burwell Heights Road",
      phoneNumber: "443-553-1132",
      email: "4hamidlkawtariq@freeallapp.com",
      speciality: "Skin & Hair",
      profileImagePath: "https://randomuser.me/api/portraits/men/80.jpg",
      profileDetails: "The bird had a belief that it was really a groundhog.",
      pricePerHour: 500,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
    Doctor(
      name: "Dr. Clark B Jackson",
      hospital: "Despair Hospital",
      address: "1245 Ritter Street",
      phoneNumber: "256-295-1204",
      email: "ghay@tirtalayana.com",
      speciality: "Mental Wellness",
      profileImagePath: "https://randomuser.me/api/portraits/women/47.jpg",
      profileDetails:
          "It turns out you don't need all that stuff you insisted you did.",
      pricePerHour: 99,
      timeSlots: [
        "10 AM - 11 AM",
        "11 AM - 12 PM",
        "12 PM - 1 PM",
        "3 PM - 4 PM",
        "4 PM - 5 PM"
      ],
    ),
  ];

  static List<Patient> patients = [
    Patient(
      age: "32",
      email: "adgeDRoberts@rhyta.com",
      gender: "Female",
      name: "Madge D. Roberts",
      phoneNumber: "314-872-7871",
      profileImage: "https://randomuser.me/api/portraits/men/3.jpg",
    ),
    Patient(
      age: "22",
      email: "anjuanitaJHicks@armyspy.com",
      gender: "Female",
      name: "Sanjuanita J. Hicks",
      phoneNumber: "425-963-1012",
      profileImage: "https://randomuser.me/api/portraits/women/85.jpg",
    ),
    Patient(
      age: "23",
      email: "LaurettaSArroyo@rhyta.com",
      gender: "Female",
      name: "Lauretta S. Arroyo",
      phoneNumber: "314-872-7871",
      profileImage: "https://randomuser.me/api/portraits/women/90.jpg",
    ),
    Patient(
      age: "18",
      email: "adgeDRoberts@rhyta.com",
      gender: "Female",
      name: "Tricia J. Fritsch",
      phoneNumber: "314-872-7871",
      profileImage: "https://randomuser.me/api/portraits/women/75.jpg",
    ),
  ];

  static List<Bookings> bookings = [
    Bookings(
      date: DateTime.now(),
      patient: patients[0],
      timeSlot: "3 PM - 4 PM",
    ),
    Bookings(
      date: DateTime.now(),
      patient: patients[1],
      timeSlot: "5 PM - 6 PM",
    ),
    Bookings(
      date: DateTime.now(),
      patient: patients[2],
      timeSlot: "7 PM - 8 PM",
    )
  ];
}
