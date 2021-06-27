import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class FabButton extends StatefulWidget {
  final Function onTap;
  FabButton({this.onTap});
  @override
  _FabButtonState createState() => _FabButtonState();
}

class _FabButtonState extends State<FabButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CircleAvatar(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      radius: 55.toWidth,
      child: FloatingActionButton(
        backgroundColor: ColorConstants.secondaryDarkAppColor,
        onPressed: widget.onTap,
        tooltip: 'Increment',
        child: Center(
          child: CircleAvatar(
            backgroundColor: ColorConstants.logoBg,
            radius: 35,
            child: Image.asset(
              AllImages().fabIcon,
              width: 68.toWidth,
              height: 68.toHeight,
            ),
          ),
        ),
        elevation: 4.0,
      ),
    );
  }
}
