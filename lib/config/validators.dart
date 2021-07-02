//It validates different input fields
class Validators {
  String validateString(String value) {
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) return "Name is required.";
    final String trimmedUserName = value.trim();
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    final RegExp onlySpaces = new RegExp(r'^\S+(\s\S+)+$');
    final RegExp spaces = new RegExp(r'^[a-zA-Z]+$');
    // final RegExp nameExp = new RegExp(r'^[A-za-z]+ {0,1}[A-za-z]*$');
    // final RegExp onlySpaces = new RegExp(r'\s');
    final RegExp spacesAtStart = new RegExp(r'( )');

    print(trimmedUserName);

    if (!nameExp.hasMatch(trimmedUserName)) return "Please enter valid name";
    if (spacesAtStart.hasMatch(value[0])) {
      return "Username must not contain any spaces at start.";
    }
    if (spacesAtStart.hasMatch(value[(value.length) - 1])) {
      return "Username must not contain any spaces at last.";
    }
    if (!onlySpaces.hasMatch(value)) {
      if (!spaces.hasMatch(value)) {
        return "More than one space between the words";
      }
    }
    if (value.contains("  ")) return "More than one space between the words";

    // if (!onlySpaces.hasMatch(trimmedUserName)) return " Wrong Spaces ";

    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) return "Email is required.";
    String trimmedEmail = value.trim();
    final RegExp nameExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\“]+(\.[^<>()[\]\\.,;:\s@\“]+)*)|(\“.+\“))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final RegExp onlySpaces = new RegExp(r'\s');
    if (onlySpaces.hasMatch(trimmedEmail)) {
      return "Email must not contain any spaces.";
    }
    if (!nameExp.hasMatch(trimmedEmail)) return "Invalid email address.";
    return null;
  }

  String validateSignupEmail(String value) {
    if (value.isEmpty) return null;
    String trimmedEmail = value.trim();
    final RegExp nameExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\“]+(\.[^<>()[\]\\.,;:\s@\“]+)*)|(\“.+\“))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final RegExp onlySpaces = new RegExp(r'\s');
    if (onlySpaces.hasMatch(trimmedEmail)) {
      return "Email must not contain any spaces.";
    }
    if (!nameExp.hasMatch(trimmedEmail)) return "Invalid email address.";
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return "Please choose a password.";
    String trimmedPassword = value.trim();
    if (trimmedPassword.length < 6)
      return "Password must be atleast 6 characters long.";
    if (trimmedPassword.length > 20)
      return "Password must be atmost 30 characters long.";
    return null;
  }

  String validateMobileNumber(String value) {
    if (value.isEmpty) return "Please enter phone no.";
    // if(value.)
    if (value.length < 10) return "Invalid number";
    return null;
  }
}
