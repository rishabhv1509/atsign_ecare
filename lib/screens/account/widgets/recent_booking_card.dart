import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class RecentBookingcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          top: 40.toHeight, left: 30.toWidth, right: 30.toWidth),
      padding:
          EdgeInsets.symmetric(vertical: 5.toHeight, horizontal: 5.toWidth),
      width: SizeConfig().screenWidth / 1.1,
      height: 360.toHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
        ],
        color: themeData.colorScheme.background,
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.toHeight, left: 20.toWidth),
                width: 160.toWidth,
                height: 160.toHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: themeData.colorScheme.primary, width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.unselectedBoxShadow,
                        blurRadius: 4)
                  ],
                  image: DecorationImage(
                      image: AssetImage(AllImages().doctorProfile),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPadding(
                    top: 25,
                    left: 50,
                    child: Row(
                      children: [
                        customContact(Icons.messenger, () {
                          Navigator.pushNamed(context, Routes.CHAT);
                        }),
                        customContact(Icons.phone, () {
                          Navigator.pushNamed(context, Routes.VIDEOCALL);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            // margin: EdgeInsets.only(left: 10.toWidth),
            width: SizeConfig().screenWidth / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [CustomPadding(top: 10, child: labelBooked())],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomPadding(
                          top: 70,
                          child: Container(
                            width: 320.toWidth,
                            child: Text(
                              'Robert KilmRobert KilmRobert KilmRobert Kilm',
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyle.cardTitleTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 10,
                      child: Text(
                        TextStrings().specialistDesignation,
                        style: CustomTextStyle.subTitleStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomPadding(
                      top: 20,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: ColorConstants.grey,
                        size: 30.toFont,
                      ),
                    ),
                    CustomPadding(
                      top: 20,
                      left: 10,
                      child: Text(
                        TextStrings().date2,
                        style: CustomTextStyle.blackBold22,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomPadding(
                      top: 20,
                      child: Icon(
                        Icons.timer,
                        color: ColorConstants.grey,
                        size: 30.toFont,
                      ),
                    ),
                    CustomPadding(
                      top: 20,
                      left: 10,
                      child: Text(
                        '03:00 PM',
                        style: CustomTextStyle.blackBold22,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customContact(IconData icon, Function onTap) {
    return Container(
      margin: EdgeInsets.only(right: 40.toWidth),
      width: 60.toWidth,
      height: 60.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: themeData.colorScheme.background,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
          ]),
      child: Center(
          child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        color: themeData.colorScheme.primary,
      )),
    );
  }

  Widget labelBooked() {
    return Container(
      width: 150.toWidth,
      height: 50.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: themeData.colorScheme.primary),
      child: Center(
        child: Text(
          TextStrings().booked,
          style: CustomTextStyle.whiteBold22,
        ),
      ),
    );
  }
}
