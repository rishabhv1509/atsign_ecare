import 'dart:io';

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
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SignUpScreenDoctorTwo extends StatefulWidget {
  @override
  _SignUpScreenDoctorTwoState createState() => _SignUpScreenDoctorTwoState();
}

class _SignUpScreenDoctorTwoState extends State<SignUpScreenDoctorTwo> {
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

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  Validators validators = Validators();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;

  File degreeFile;

  File idFile;

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
                SpaceBox(50),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig().screenWidth,
                    height: 200.toHeight,
                    child: Column(
                      children: [
                        SizedBox(height: 50.toHeight),
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
                                    Text(
                                      "Upload Degree (PDF)",
                                      style: TextStyle(
                                        fontSize: 26.toFont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SpaceBox(40.toHeight),
                                    if (degreeFile != null)
                                      Text(
                                        "File : ${degreeFile.path.split("/").last}",
                                        style: TextStyle(
                                          fontSize: 26.toFont,
                                        ),
                                      ),
                                    SpaceBox(40.toHeight),
                                    GestureDetector(
                                      onTap: () async {
                                        FilePickerResult degreeFilePicked =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (degreeFilePicked != null) {
                                          setState(() {
                                            degreeFile = File(degreeFilePicked
                                                .files.single.path);
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 21.toWidth),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 20.toHeight,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstants.logoBg,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.file_upload,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10.toWidth),
                                            Text(
                                              "Upload",
                                              style: TextStyle(
                                                fontSize: 26.toFont,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SpaceBox(120.toHeight),
                                    Text(
                                      "Govt. Approved ID (Passport / Driving License)",
                                      style: TextStyle(
                                        fontSize: 26.toFont,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SpaceBox(40.toHeight),
                                    if (idFile != null)
                                      Text(
                                        "File : ${idFile.path.split("/").last}",
                                        style: TextStyle(
                                          fontSize: 26.toFont,
                                        ),
                                      ),
                                    SpaceBox(40.toHeight),
                                    GestureDetector(
                                      onTap: () async {
                                        FilePickerResult idFilePicked =
                                            await FilePicker.platform
                                                .pickFiles();
                                        if (idFilePicked != null) {
                                          setState(() {
                                            idFile = File(
                                                idFilePicked.files.single.path);
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 21.toWidth),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 20.toHeight,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstants.logoBg,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.file_upload,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10.toWidth),
                                            Text(
                                              "Upload",
                                              style: TextStyle(
                                                fontSize: 26.toFont,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Spacer(),
                        CustomButton(
                            buttonText: TextStrings().buttonContinue,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.SIGNUPSCREENDOCTORTHREE);
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
