class Patient {
  final String name;
  final String phoneNumber;
  final String email;
  final String age;
  final String gender;

  Patient({
    this.name,
    this.phoneNumber,
    this.email,
    this.age,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'age': age,
        'gender': gender,
      };

  Patient.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        age = json['age'],
        gender = json['gender'];
}
