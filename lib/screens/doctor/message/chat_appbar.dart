import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class DoctorChatAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomPadding(
      top: 20,
      child: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.secondaryDarkAppColor,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.black,
          ),
        ),
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.VIDEOCALL);
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: 10.toHeight, bottom: 5.toHeight, right: 10.toWidth),
                width: 80.toWidth,
                height: 80.toHeight,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: ColorConstants.unselectedBoxShadow,
                          blurRadius: 4)
                    ],
                    border: Border.all(
                        color: ColorConstants.unselectedBoxShadow, width: 3),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(AllImages().specialistImage),
                        fit: BoxFit.cover)),
              ),
            ),
            Column(
              children: [
                CustomPadding(
                  left: 14,
                  child: Text(
                    'Robert Kilm',
                    style: CustomTextStyle.appBarTitleStyle,
                  ),
                ),
                Text(
                  'MD, Neurology',
                  style: CustomTextStyle.subTitleStyle,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 180.toWidth),
              width: 70.toWidth,
              height: 70.toHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorConstants.secondaryDarkAppColor,
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.unselectedBoxShadow,
                        blurRadius: 20)
                  ]),
              child: Center(
                  child: IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
                color: ColorConstants.logoBg,
              )),
            )
          ],
        ),
      ),
    );
  }
}
