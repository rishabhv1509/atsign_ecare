import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Function onTap;
  final String cardIcon;
  final String cardTitle;
  CategoryCard({this.onTap, this.cardIcon = '', this.cardTitle = ''});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: 11.toHeight,
          bottom: 11.toHeight,
          left: 12.toWidth,
          right: 12.toWidth,
        ),
        width: SizeConfig().screenWidth / 2.27,
        height: SizeConfig().screenHeight / 4.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: ColorConstants.homeScreenShadow)
          ],
        ),
        child: Card(
          color: ColorConstants.secondaryDarkAppColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                cardIcon,
                width: 102.toWidth,
                height: 104.toHeight,
              ),
              SpaceBox(45.toHeight),
              Text(
                cardTitle,
                style: CustomTextStyle.cardTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
