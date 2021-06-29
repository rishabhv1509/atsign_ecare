import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  final String phoneNumber;
  final String userType;
  AccountScreen({this.phoneNumber, this.userType});
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String phoneNumber;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: SizeConfig().screenWidth,
                height: 400.toHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  ColorConstants.profilebgone,
                  ColorConstants.profilebgtwo
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // Function for edit scrren need to be added here
                    },
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 40.toHeight, right: 30.toWidth),
                      width: 90.toWidth,
                      height: 90.toWidth,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstants.unselectedBoxShadow,
                              blurRadius: 10)
                        ],
                        color: themeData.colorScheme.background,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Image.asset(AllImages().edit),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 250.toHeight),
                    width: 250.toWidth,
                    height: 250.toWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: themeData.colorScheme.primary, width: 4),
                        image: DecorationImage(
                            image: AssetImage(AllImages().videoCallDoctor),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ],
          ),
          SpaceBox(30),
          profileContent(
              title: "",
              icon: Icons.account_circle_outlined,
              titleStyle: CustomTextStyle.appBarTitleStyle),
          SpaceBox(20),
          profileContent(
              title: '+91 8904871491',
              icon: Icons.call,
              titleStyle: CustomTextStyle.cardTextStyle),
          SpaceBox(40),
          profileListTile(
              action: () {
                Navigator.pushNamed(context, Routes.BOOKINGHISTORY);
              },
              optionName: TextStrings().bookingHistory,
              trailingImage: AllImages().history),
          profileListTile(
              action: () {
                Navigator.pushNamed(context, Routes.REPORTS);
              },
              optionName: TextStrings().reports,
              trailingImage: AllImages().reports),
          profileListTile(
              action: () {
                Navigator.pushNamed(context, Routes.PRESCRIPTION);
              },
              optionName: TextStrings().prescription,
              trailingImage: AllImages().prescription),
          profileListTile(
              action: () {
                Navigator.pushNamed(context, Routes.CHANGEPASSWORD);
              },
              optionName: TextStrings().changePassword,
              trailingImage: AllImages().changePassword),
          profileListTile(
              action: () {
                print('User Signout');
              },
              optionName: TextStrings().signout,
              trailingImage: AllImages().signout),
        ],
      ),
    );
  }
}

Widget profileContent({String title, IconData icon, TextStyle titleStyle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        size: 35.toFont,
        color: ColorConstants.grey,
      ),
      CustomPadding(
        left: 10,
        child: Text(
          title,
          style: titleStyle,
        ),
      )
    ],
  );
}

Widget profileListTile(
    {String optionName, String trailingImage, Function action}) {
  return InkWell(
    onTap: action,
    child: Container(
      width: SizeConfig().screenWidth,
      margin: EdgeInsets.only(
          left: 40.toWidth, right: 40.toWidth, top: 25.toHeight),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                optionName,
                style: optionName == TextStrings().signout
                    ? CustomTextStyle.appBarTitleStyle
                    : CustomTextStyle.cardTextStyle,
              ),
              Image.asset(trailingImage),
            ],
          ),
          SpaceBox(10),
          Divider(
            color: themeData.colorScheme.primaryVariant,
            thickness: 1,
          )
        ],
      ),
    ),
  );
}
