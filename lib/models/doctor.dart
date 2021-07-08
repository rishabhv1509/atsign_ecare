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
  final List<String> timeSlote;
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
    this.timeSlote,
    this.pricePerHour,
    this.address,
    this.hospital,
    this.localIdPath,
    this.localDegreePath,
    this.localProfileImagePath,
  });
}
