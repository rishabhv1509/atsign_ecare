class Category {
  String name;
  String assetImage;
  bool isSelected;
  String userType;
  Category(this.name, this.assetImage, this.isSelected, this.userType);
}

class UserType {
  String userType;
  UserType(this.userType);
}

class UserDetail {
  String name;
  String phoneNumber;
  String userType;
  String email;
  String profileImage;
  UserDetail({this.name, this.phoneNumber, this.email, this.userType, this.profileImage});
}
