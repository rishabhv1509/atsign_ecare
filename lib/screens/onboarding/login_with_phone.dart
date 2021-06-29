import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/validators.dart';
import 'package:atsign_ecare/screens/otp_verification.dart/otp_verification_login.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  final String userType;
  LoginWithPhone({this.userType});
  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final TextEditingController _phoneNumberController = TextEditingController();
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
              child: CustomTextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                hintText: TextStrings().loginTextFieldText,
                prefixIcon: Icons.call,
                validator: validators.validateMobileNumber,
              ),
            ),
          ),
        ),
        SpaceBox(340),
        CustomButton(
          buttonText: TextStrings().buttonLogin,
          onTap: () {
            if (widget.userType == 'Doctor') {
            } else {}
          },
        ),
      ],
    );
  }

  loginFormValidate() {
    if (_formkey.currentState.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginOtpVerification(
          phoneNumber: '+91' + _phoneNumberController.text,
          userType: widget.userType,
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
