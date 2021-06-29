import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class CustomBorderBox extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String content;
  final bool badge;
  final List badgeList;
  const CustomBorderBox(
      {Key key,
      this.width,
      this.height,
      this.title: "",
      this.content,
      this.badge: true,
      this.badgeList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: 15.toHeight, horizontal: 40.toWidth),
      width: width ?? 630.toWidth,
      height: height ?? 180.toHeight,
      decoration: BoxDecoration(
        border: Border.all(
            color: themeData.colorScheme.primaryVariant,
            width: 3.0.toWidth,
            style: BorderStyle.solid), //Border.all

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: (badge == false)
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.toWidth, vertical: 20.toHeight),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomTextStyle.appBarTitleStyle.copyWith(
                        fontSize: 28.toFont,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.toWidth, vertical: 20.toHeight),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomTextStyle.appBarTitleStyle.copyWith(
                        fontSize: 24.toFont,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 28.toHeight),
                    content == null && badge
                        ? buildBadge()
                        : content == null
                            ? Container()
                            : Container(
                                child: Text(
                                  content,
                                  style: CustomTextStyle.loginTextfieldStyle
                                      .copyWith(
                                          fontSize: 23.toFont,
                                          height: 2.5.toHeight),
                                ),
                              )
                  ]),
            ),
    );
  }

  Expanded buildBadge() {
    return Expanded(
      child: SizedBox(
        height: 30.toHeight,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: badgeList.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomPadding(
                bottom: 10,
                top: 10,
                right: 15,
                child: Container(
                  width: 150.toWidth,
                  child: Center(
                    child: Text(
                      badgeList[index],
                      style: CustomTextStyle.loginTextfieldStyle
                          .copyWith(fontSize: 18.toFont, height: 2.5.toHeight),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: themeData.colorScheme.primaryVariant,
                        width: 3.0.toWidth,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
