import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class PastBookingcard extends StatelessWidget {
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
                margin: EdgeInsets.only(top: 30.toHeight, left: 50.toWidth),
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
                      image: AssetImage(AllImages().videoCallPatient),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              CustomPadding(
                top: 25,
                left: 60,
                child: Row(
                  children: [
                    labelBookagain(onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 40.toWidth),
            width: SizeConfig().screenWidth / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 50,
                      child: Container(
                        width: 320.toWidth,
                        child: Text(
                          TextStrings().appBarTitle,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyle.cardTitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 10,
                      child: Text(
                        'HSR Layout, Bengaluru.',
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
                        TextStrings().time,
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

  Widget labelBookagain({Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150.toWidth,
        height: 50.toHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: themeData.colorScheme.primary),
        child: Center(
          child: Text(
            TextStrings().bookAgain,
            style: CustomTextStyle.whiteBold22,
          ),
        ),
      ),
    );
  }
}
