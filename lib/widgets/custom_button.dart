import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final Function() onTap;
  const CustomButton({this.buttonText, this.onTap, this.width, this.height});

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 511.toWidth,
        height: height ?? 96.toHeight,
        decoration: BoxDecoration(
            color: ColorConstants.logoBg,
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: CustomTextStyle.customButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
