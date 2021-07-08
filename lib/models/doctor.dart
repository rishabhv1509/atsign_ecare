class Doctor {
  final String name;
  final String phoneNumber;
  final String email;
  final String speciality;
  final String location;
  final double yearsOfExp;

  final String localIdPath;
  final String localDegreePath;
  final String localProfileImagePath;

  final String degreePath;
  final String idPath;
  final String profileImagePath;
  final String profileDetails;
  final List<String> daySlots;
  final List<dynamic> timeSlots;
  final double pricePerHour;
  final String address;
  final String hospital;

  Doctor({
    this.name,
    this.phoneNumber,
    this.email,
    this.speciality,
    this.location,
    this.yearsOfExp,
    this.degreePath,
    this.idPath,
    this.profileImagePath,
    this.profileDetails,
    this.daySlots,
    this.timeSlots,
    this.pricePerHour,
    this.address,
    this.hospital,
    this.localIdPath,
    this.localDegreePath,
    this.localProfileImagePath,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "speciality": speciality,
        "location": location,
        "yearsOfExp": yearsOfExp,
        "degreePath": degreePath,
        "idPath": idPath,
        "profileImagePath": profileImagePath,
        "profileDetails": profileDetails,
        "daySlots": daySlots,
        "timeSlots": timeSlots,
        "pricePerHour": pricePerHour,
        "address": address,
        "hospital": hospital,
        "localIdPath": localIdPath,
        "localDegreePath": localDegreePath,
        "localProfileImagePath": localProfileImagePath,
      };

  Doctor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        speciality = json['speciality'],
        location = json['location'],
        yearsOfExp = json['yearsOfExp'],
        degreePath = json['degreePath'],
        idPath = json['idPath'],
        profileImagePath = json['profileImagePath'],
        profileDetails = json['profileDetails'],
        daySlots = json['daySlots'],
        timeSlots = json['timeSlots'],
        pricePerHour = json['pricePerHour'],
        address = json['address'],
        hospital = json['hospital'],
        localIdPath = json['localIdPath'],
        localDegreePath = json['localDegreePath'],
        localProfileImagePath = json['localProfileImagePath'];
}
