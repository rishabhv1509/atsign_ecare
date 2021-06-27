import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/doctor/widgets/custom_border_box.dart';
import 'package:atsign_ecare/screens/doctor/widgets/switch_screen.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatefulWidget {
  final String userType;
  final String phoneNumber;

  DoctorProfileScreen({this.userType, this.phoneNumber});
  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: SizeConfig().screenWidth,
                height: 350.toHeight,
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
                      Navigator.pushNamed(context, Routes.EDITDOCTORPROFILE);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 70.toHeight, right: 30.toWidth),
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
                    margin: EdgeInsets.only(top: 200.toHeight),
                    width: 250.toWidth,
                    height: 250.toWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: themeData.colorScheme.primary, width: 4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: themeData.colorScheme.primary, width: 4),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(
                        Icons.account_circle,
                        size: 80.toFont,
                        color: ColorConstants.logoBg,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SpaceBox(30),
          Text('Mathilda Rogers', style: CustomTextStyle.appBarTitleStyle),
          SpaceBox(10),
          Text(TextStrings().qualification,
              style: CustomTextStyle.loginTextfieldStyle
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 26.toFont)),
          SpaceBox(30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  AllImages().location,
                ),
              ),
              SizedBox(
                width: 10.toWidth,
              ),
              Text(
                TextStrings().location,
                style: CustomTextStyle.cardTextStyle
                    .copyWith(fontSize: 28.toFont, fontWeight: FontWeight.w400),
              ),
              Text(TextStrings().pipe),
              Image(
                image: AssetImage(
                  AllImages().dollar,
                ),
              ),
              SizedBox(
                width: 10.toWidth,
              ),
              Text(
                TextStrings().money,
                style: CustomTextStyle.cardTextStyle
                    .copyWith(fontSize: 28.toFont, fontWeight: FontWeight.w400),
              ),
              Text(
                TextStrings().perHour,
                style: CustomTextStyle.cardTextStyle
                    .copyWith(fontSize: 18.toFont, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SpaceBox(20),
          SwitchScreen(),
          SizedBox(height: 30.toHeight),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBorderBox(
                  title: TextStrings().experience,
                  badge: false,
                  height: 85.toHeight,
                ),
                CustomBorderBox(
                  title: TextStrings().speciality,
                  badgeList: TextStrings().specialityList,
                ),
                CustomBorderBox(
                  title: TextStrings().availableSlotDays,
                  badgeList: TextStrings().availableSlotDaysList,
                ),
                CustomBorderBox(
                  title: TextStrings().availableSlotTime,
                  badgeList: TextStrings().availableSlotTimeList,
                ),
                CustomBorderBox(
                  height: 250.toHeight,
                  title: TextStrings().about,
                  content: TextStrings().aboutContent,
                ),
              ],
            ),
          ),
          SizedBox(height: 90.toHeight),
        ],
      ),
    ));
  }
}
