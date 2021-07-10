import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/main_screen.dart';
import 'package:atsign_ecare/screens/welcome_screen/welcome_screen.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String phoneNumber, userType;
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
                  "WeCare",
                  style: CustomTextStyle.appTitleStyle.copyWith(fontSize: 45),
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
                Navigator.pushNamed(context, Routes.SIGNUPSCREEN);
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
            SpaceBox(100),
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
