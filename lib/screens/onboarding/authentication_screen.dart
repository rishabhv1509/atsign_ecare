import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/data/category.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/custom_radio_button.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
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
    redirect();
  }

  redirect() async {
    // var patientData =
    //     await SharedPreferenceService.getData(SharedPrefConstant.PatientData);
    // if (patientData != "") Navigator.of(context).pushNamed(Routes.HOMESCREEN);
    // var doctorData =
    //     await SharedPreferenceService.getData(SharedPrefConstant.DoctorData);
    // if (doctorData != "") Navigator.of(context).pushNamed(Routes.DOCTORHOME);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    void _showError(String error) async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error),
      ));
    }

    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  category.forEach((category) =>
                                      category.isSelected = false);
                                  category[index].isSelected = true;
                                  print(category[index].userType);
                                  userType = category[index].userType;
                                });
                              },
                              child: CustomRadioButton(category[index]),
                            ),
                          );
                        }),
                  ),
                ),
                SpaceBox(50),
                CustomButton(
                    buttonText: TextStrings().buttonContinue,
                    onTap: () {
                      if (userType == 'Doctor') {
                        Navigator.pushNamed(context, Routes.SIGNUPSCREENDOCTOR);
                      } else {
                        Navigator.pushNamed(
                            context, Routes.SIGNUPSCREENPATIENT);
                      }
                    }),
                SpaceBox(50),
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
}
