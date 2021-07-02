import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/validators.dart';
import 'package:atsign_ecare/data/category.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class SignUpScreenPatient extends StatefulWidget {
  @override
  _SignUpScreenPatientState createState() => _SignUpScreenPatientState();
}

class _SignUpScreenPatientState extends State<SignUpScreenPatient> {
  bool showLoginForm = false;
  bool showLoginWithEmail = false;
  List<Category> category = [];
  // ignore: close_sinks

  String userType;
  @override
  void initState() {
    category.add(new Category(TextStrings().chooseDoctor,
        AllImages().doctorIcon, false, TextStrings().userTypeDoctor));
    category.add(new Category(TextStrings().choosePatient,
        AllImages().patientIcon, false, TextStrings().userTypePatient));
    super.initState();
  }

  bool showOtpScreen = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  Validators validators = Validators();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.toHeight),
                rowStart([
                  CustomPadding(
                    top: 60.0,
                    left: 50.0,
                    child: Text(
                      showLoginForm
                          ? TextStrings().loginTitleText
                          : TextStrings().signupTitle,
                      style: CustomTextStyle.titleTextStyle,
                    ),
                  )
                ]),
                rowStart([
                  CustomPadding(
                    top: 20.0,
                    left: 55.0,
                    child: Text(
                      showLoginForm
                          ? TextStrings().loginSubTitleText
                          : TextStrings().signupSubTitleText,
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.subTitleStyle,
                    ),
                  ),
                ]),
                SpaceBox(100),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig().screenWidth,
                    height: 200.toHeight,
                    child: Column(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      hintText:
                                          TextStrings().signupMobileNumber,
                                      prefixIcon: Icons.call,
                                      validator:
                                          validators.validateMobileNumber,
                                    ),
                                    SpaceBox(50.toHeight),
                                    CustomTextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: TextStrings().signupEmail,
                                      prefixIcon: Icons.mail_outline,
                                      validator: validators.validateSignupEmail,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Spacer(),
                        CustomButton(
                            buttonText: "SUBMIT",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.HOMESCREEN,
                              );
                            })
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.toHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowStart(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: child,
    );
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
