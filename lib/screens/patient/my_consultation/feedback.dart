import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: false,
        showTitle: true,
        title: TextStrings().feedback,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.VIDEOCALL);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          rowCenter(
            [
              Container(
                width: 250.toWidth,
                height: 250.toHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AllImages().videoCallDoctor,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: ColorConstants.logoBg, width: 3),
                    color: ColorConstants.secondaryDarkAppColor),
              )
            ],
          ),
          SpaceBox(50),
          Text(
            'Robert Klim',
            textAlign: TextAlign.center,
            style: CustomTextStyle.titleTextStyle,
          ),
          SpaceBox(10),
          Container(
            margin: EdgeInsets.only(left: 100.toWidth, right: 100.toWidth),
            child: Text(
              'MD, Neurology',
              textAlign: TextAlign.center,
              style: CustomTextStyle.subTitleStyle,
            ),
          ),
          SpaceBox(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPadding(
                top: 15,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 60.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 60.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 60.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 60.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 60.toFont,
                      color: ColorConstants.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: 100.toHeight, left: 30.toWidth, right: 30.toWidth),
            width: SizeConfig().screenWidth / 1.25,
            height: 230.toHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorConstants.secondaryDarkAppColor,
                boxShadow: [
                  BoxShadow(
                      color: ColorConstants.unselectedBoxShadow, blurRadius: 6)
                ]),
            child: Column(
              children: [
                CustomPadding(
                  top: 30,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        TextStrings().comments,
                        style: CustomTextStyle.cardTextStyle,
                      ),
                    ],
                  ),
                ),
                CustomPadding(
                  top: 30,
                  left: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: TextStrings().writeComments,
                        hintStyle: CustomTextStyle.chatLabel),
                  ),
                ),
              ],
            ),
          ),
          SpaceBox(100),
          CustomButton(
            buttonText: TextStrings().buttonSubmit,
            onTap: () {
              Navigator.pushNamed(context, Routes.HOMESCREEN);
            },
          ),
          SpaceBox(50),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.HOMESCREEN);
              },
              child: Text(
                TextStrings().buttonSkip,
                style: CustomTextStyle.cardTextStyle,
              )),
          SpaceBox(50),
        ],
      ),
    );
  }

  Widget rowCenter(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: child,
    );
  }
}
