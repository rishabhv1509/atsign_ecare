import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/validators.dart';
import 'package:atsign_ecare/screens/onboarding/widgets/custom_flat_button.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_login.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class LoginWithEmail extends StatefulWidget {
  final String userType;
  LoginWithEmail({this.userType});
  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  Validators validators = Validators();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
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
                    controller: _emailController,
                    keyboardType: TextInputType.phone,
                    hintText: TextStrings().signupEmail,
                    prefixIcon: Icons.mail_outline,
                    validator: validators.validateEmail,
                  ),
                  SpaceBox(50),
                  CustomTextFormField(
                    showSuffixIcon: true,
                    controller: _passwordController,
                    hintText: TextStrings().enterPassword,
                    prefixIcon: Icons.lock,
                    obsecureText: true,
                  ),
                  SpaceBox(50),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomFlatButton(
                          onTap: () {},
                          accountType: 'Forgot Password ?',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SpaceBox(160),
        CustomButton(
          buttonText: TextStrings().buttonLogin,
          onTap: () {},
        ),
      ],
    );
  }

  loginFormValidate(userInfoProvider) {
    if (_formkey.currentState.validate()) {
      if (_formkey.currentState.validate()) {
        /// TO NOTE : Hard coded the value for testing purpose.

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return LoginOtpVerification(
            phoneNumber: '+911234567890',
            userType: 'Doctor',
          );
        }));
      }
    }
  }

  Widget errorAlert() {
    return SnackBar(
      duration: Duration(seconds: 10),
      elevation: 10.toHeight,
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      content: Text(
        'Phone Number doesnot exists',
        style: TextStyle(color: ColorConstants.logoBg),
      ),
      action: SnackBarAction(
        label: 'SignUp',
        onPressed: () {
          _formkey.currentState.reset();
        },
      ),
    );
  }
}
