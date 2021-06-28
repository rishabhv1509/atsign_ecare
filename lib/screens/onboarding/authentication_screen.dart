import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/data/category.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/onboarding/login_with_email.dart';
import 'package:atsign_ecare/screens/onboarding/login_with_phone.dart';
import 'package:atsign_ecare/screens/onboarding/signup_screen.dart';
import 'package:atsign_ecare/screens/onboarding/widgets/custom_flat_button.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
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
      appBar: CustomAppBar(
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
        leadingIcon: Icons.arrow_back_ios,
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          child: Column(
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
              Container(
                alignment: Alignment.center,
                width: SizeConfig().screenWidth,
                height: 200.toHeight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            category.forEach(
                                (category) => category.isSelected = false);
                            category[index].isSelected = true;
                            print(category[index].userType);
                            userType = category[index].userType;
                          });
                        },
                        child: CustomRadioButton(category[index]),
                      );
                    }),
              ),
              SpaceBox(50),
              showLoginForm
                  ? showLoginWithEmail
                      ? LoginWithEmail(userType: userType)
                      : LoginWithPhone(userType: userType)
                  : SignUpForm(userType: userType),
              showLoginForm
                  ? Column(
                      children: [
                        showLoginWithEmail
                            ? CustomPadding(
                                bottom: 30.0,
                                top: 30.0,
                                child: CustomFlatButton(
                                  onTap: () {
                                    // Directs the user for Login screen
                                    setState(() {
                                      showLoginForm = true;
                                      showLoginWithEmail = false;
                                    });
                                  },
                                  accountTypedes: 'Login with ',
                                  accountType: ' Phone Number',
                                ),
                              )
                            : CustomPadding(
                                bottom: 30.0,
                                top: 30.0,
                                child: CustomFlatButton(
                                  onTap: () {
                                    // Directs the user for Login screen
                                    setState(() {
                                      showLoginForm = true;
                                      showLoginWithEmail = true;
                                    });
                                  },
                                  accountTypedes: 'Login with ',
                                  accountType: ' Email and Password',
                                ),
                              ),
                        CustomPadding(
                          bottom: 45.0,
                          child: CustomFlatButton(
                            onTap: () {
                              // Directs the user for Login screen
                              setState(() {
                                showLoginForm = false;
                              });
                            },
                            accountTypedes: TextStrings().noAccount,
                            accountType: TextStrings().buttonSignup,
                          ),
                        ),
                      ],
                    )
                  : CustomPadding(
                      bottom: 45.0,
                      top: 30.0,
                      child: CustomFlatButton(
                        onTap: () {
                          // Directs the user for signup screen
                          setState(() {
                            showLoginForm = true;
                          });
                        },
                        accountTypedes: TextStrings().haveAccount,
                        accountType: TextStrings().buttonLogin,
                      ),
                    )
            ],
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
