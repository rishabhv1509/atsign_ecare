import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/validators.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_signup.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final String userType;
  SignUpForm({
    Key key,
    this.userType,
  }) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool showOtpScreen = false;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  Validators validators = Validators();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return showOtpScreen
        ? SignUpOtpVerification()
        : Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 550.toWidth,
                  color: ColorConstants.secondaryDarkAppColor,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      autovalidateMode: autovalidate,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            hintText: TextStrings().signupName,
                            prefixIcon: Icons.account_circle_outlined,
                            validator: validators.validateName,
                          ),
                          SpaceBox(50.toHeight),
                          CustomTextFormField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            hintText: TextStrings().signupMobileNumber,
                            prefixIcon: Icons.call,
                            validator: validators.validateMobileNumber,
                          ),
                          SpaceBox(50.toHeight),
                          CustomTextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: TextStrings().signupEmail,
                            prefixIcon: Icons.mail_outline,
                            validator: validators.validateSignupEmail,
                          ),
                          SpaceBox(50.toHeight),
                          CustomTextFormField(
                            showSuffixIcon: true,
                            controller: _passwordController,
                            obsecureText: true,
                            hintText: TextStrings().enterPassword,
                            prefixIcon: Icons.lock,
                          ),
                          SpaceBox(50.toHeight),
                          CustomTextFormField(
                              showSuffixIcon: true,
                              controller: _confirmPasswordController,
                              obsecureText: true,
                              hintText: TextStrings().confirmPassword,
                              prefixIcon: Icons.lock,
                              validator: (val) {
                                if (val.isEmpty) return 'Empty';
                                if (val != _passwordController.text)
                                  return 'Your password and confirmation password do not match.';
                                return null;
                              }),
                        ],
                      ),
                    ),
                  )),
              SpaceBox(50),
              CustomButton(
                  buttonText: TextStrings().buttonSignup,
                  onTap: () {
                    if (widget.userType == 'Doctor') {
                    } else {}
                  })
            ],
          );
  }

  formValidate() {
    if (_formkey.currentState.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return SignUpOtpVerification(
          userType: widget.userType,
          name: _nameController.text,
          phoneNumber: '+91' + _phoneNumberController.text,
          email: _emailController.text,
        );
      }));
    }
  }

  Widget errorAlert() {
    return SnackBar(
      duration: Duration(seconds: 10),
      elevation: 10.toHeight,
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      content: Text(
        'Phone Number already exists',
        style: TextStyle(color: ColorConstants.logoBg),
      ),
      action: SnackBarAction(
        label: 'Login',
        onPressed: () {
          _formkey.currentState.reset();
        },
      ),
    );
  }
}
