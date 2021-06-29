import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class CustomNavButton extends StatefulWidget {
  final Function nextButton;
  final Function prevButton;
  CustomNavButton({this.nextButton, this.prevButton});
  @override
  _CustomNavButtonState createState() => _CustomNavButtonState();
}

class _CustomNavButtonState extends State<CustomNavButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          margin: EdgeInsets.only(
              left: 30.toWidth,
              right: 30.toWidth,
              bottom: 30.toHeight,
              top: 30.toHeight),
          width: SizeConfig().screenWidth,
          height: 130.toHeight,
          decoration: BoxDecoration(
              color: ColorConstants.logoBg,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                    color: ColorConstants.indicatorColor,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 20)
              ]),
          child: SizedBox.expand(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomPadding(
                  left: 30,
                  child: InkWell(
                    onTap: widget.prevButton,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 35.toFont,
                          color: ColorConstants.secondaryDarkAppColor,
                        ),
                        CustomPadding(
                          left: 20,
                          child: Text(
                            TextStrings().buttonBack,
                            style: CustomTextStyle.white26,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: widget.nextButton,
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 90.toWidth,
                    height: 90.toHeight,
                    decoration: BoxDecoration(
                      color: ColorConstants.secondaryDarkAppColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 40.toFont,
                        color: ColorConstants.logoBg,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
