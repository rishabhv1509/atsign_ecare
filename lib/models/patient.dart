class Patient {
  final String name;
  final String phoneNumber;
  final String email;
  final String age;
  final String gender;
  final String profileImage;

  Patient({
    this.name,
    this.phoneNumber,
    this.email,
    this.age,
    this.gender,
    this.profileImage,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'age': age,
        'gender': gender,
        'profileImage': profileImage,
      };

  Patient.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        age = json['age'],
        profileImage = json['profileImage'],
        gender = json['gender'];
}
