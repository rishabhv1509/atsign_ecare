import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/screens/main_screen.dart';
import 'package:atsign_ecare/screens/welcome_screen/welcome_screen.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String phoneNumber, userType;
  BackendService _backendService = BackendService.getInstance();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
      width: SizeConfig().screenWidth,
      height: SizeConfig().screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AllImages().backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: SizeConfig().screenWidth,
        height: SizeConfig().screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfff09681).withOpacity(0.5),
              Color(0xfffcbbac).withOpacity(0.5)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            rowCenter([
              CircleAvatar(
                radius: 100.toWidth,
                backgroundColor: ColorConstants.logoBg,
                child: Center(
                  child: Image.asset(
                    AllImages().ecareLogo,
                  ),
                ),
              )
            ]),
            SpaceBox(40),
            rowCenter(
              [
                Text(
                  TextStrings().appName,
                  style: CustomTextStyle.appTitleStyle,
                ),
              ],
            ),
            SpaceBox(120),
            rowCenter(
              [
                Text(
                  TextStrings().tagLine,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.tagLineStyle,
                ),
              ],
            ),
            SpaceBox(10),
            rowCenter(
              [
                Icon(
                  Icons.more_horiz_outlined,
                  size: 50,
                )
              ],
            ),
            SpaceBox(70),
            InkWell(
              onTap: () {
                _backendService.checkToOnboard();
              },
              child: Container(
                width: 511.toWidth,
                height: 96.toHeight,
                decoration: BoxDecoration(
                    color: ColorConstants.logoBg,
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    TextStrings().buttonLogin,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.customButtonTextStyle,
                  ),
                ),
              ),
            ),
            SpaceBox(50),
            CustomPadding(
              bottom: 45,
              child: rowCenter(
                [
                  Text(
                    TextStrings().noAccount,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.white26,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    child: Text(
                      TextStrings().buttonSignup,
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.whiteBold26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  navigate(bool isSignedIn, String userType, String phoneNumber) {
    if (isSignedIn == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return MainScreen(
          phoneNumber: phoneNumber,
          userType: userType,
        );
      }));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return WelcomeScreen(
          phoneNumber: phoneNumber,
          userType: userType,
        );
      }));
    }
  }

  Widget rowCenter(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: child,
    );
  }
}
