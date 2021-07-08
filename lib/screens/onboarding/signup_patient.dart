import 'dart:convert';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/config/validators.dart';
import 'package:atsign_ecare/models/patient.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/shared_preferences_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SignUpScreenPatient extends StatefulWidget {
  @override
  _SignUpScreenPatientState createState() => _SignUpScreenPatientState();
}

class _SignUpScreenPatientState extends State<SignUpScreenPatient> {
  bool showLoginForm = false;
  bool showLoginWithEmail = false;
  // ignore: close_sinks

  String userType;
  String selectedGender = "";
  @override
  void initState() {
    super.initState();
  }

  bool showOtpScreen = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  dynamic _age = 1.0;

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
                                    SpaceBox(80.toHeight),
                                    Text(
                                      "Age ${_age == 0.0 ? "" : "- " + _age.toInt().toString()}",
                                      style: TextStyle(
                                        fontSize: 26.toFont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SpaceBox(20.toHeight),
                                    SfSlider(
                                      min: 0.0,
                                      max: 100.0,
                                      value: _age,
                                      interval: 20,
                                      showTicks: true,
                                      showLabels: true,
                                      enableTooltip: true,
                                      activeColor: ColorConstants.logoBg,
                                      inactiveColor: ColorConstants.boxShadow,
                                      minorTicksPerInterval: 1,
                                      stepSize: 1.0,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _age = value;
                                        });
                                      },
                                    ),
                                    SpaceBox(80.toHeight),
                                    Text(
                                      "Gender",
                                      style: TextStyle(
                                        fontSize: 26.toFont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SpaceBox(20.toHeight),
                                    customChip(
                                      chipText: [
                                        'Male',
                                        'Female',
                                        'Other',
                                      ],
                                      selected: selectedGender,
                                      onTap: (String itemName) {
                                        selectedGender = itemName;

                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Spacer(),
                        CustomButton(
                            buttonText: "SUBMIT",
                            onTap: () async {
                              if (selectedGender == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  errorAlert("Please select gender"),
                                );
                              } else {
                                await SharedPreferenceService.setData(
                                  SharedPrefConstant.PatientData,
                                  json.encode(
                                    Patient(
                                      age: _age.toString(),
                                      email: _emailController.text,
                                      gender: selectedGender,
                                      name: _nameController.text,
                                      phoneNumber: _phoneNumberController.text,
                                    ).toJson(),
                                  ),
                                );
                                Navigator.pushNamed(
                                  context,
                                  Routes.HOMESCREEN,
                                );
                              }
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

  Widget contentPadding({Widget child}) {
    return CustomPadding(
      top: 40.0.toHeight,
      left: 50.0.toWidth,
      right: 50.toWidth,
      child: child,
    );
  }

  Widget customChip({
    List<String> chipText,
    String selected,
    Function onTap,
  }) {
    return Container(
      width: SizeConfig().screenWidth,
      height: 80.toHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chipText.length,
        itemBuilder: (BuildContext context, int index) {
          bool select = selected == chipText[index];
          print("select $select");
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.toWidth, vertical: 10.toHeight),
              child: GestureDetector(
                onTap: () {
                  onTap(chipText[index]);
                },
                child: Chip(
                  label: Text(chipText[index]),
                  labelStyle: !select
                      ? CustomTextStyle.subTitleStyle
                      : CustomTextStyle.customButtonTextStyle,
                  backgroundColor: !select
                      ? Color(0xffF7F9FD)
                      : themeData.colorScheme.primary,
                ),
              ));
        },
      ),
    );
  }

  Widget rowStart(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: child,
    );
  }

  SnackBar errorAlert(message) {
    return SnackBar(
      duration: Duration(seconds: 3),
      elevation: 10.toHeight,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }
}
