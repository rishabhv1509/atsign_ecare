import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class RecieveMessage extends StatefulWidget {
  @override
  _RecieveMessageState createState() => _RecieveMessageState();
}

class _RecieveMessageState extends State<RecieveMessage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: 20.toHeight, horizontal: 20.toHeight),
        padding: EdgeInsets.symmetric(
            vertical: 20.toHeight, horizontal: 20.toHeight),
        width: SizeConfig().screenWidth / 1.5,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
            ],
            color: ColorConstants.secondaryDarkAppColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(6))),
        child: Column(
          children: [
            Center(
              child: Text(
                'Hey Mark. Send me the report. I’ll have a look',
                style: CustomTextStyle.recieveMessageStyle,
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Text(
                '09:15 PM',
                style: CustomTextStyle.recieveMessageStyle,
              ),
            ),
          ],
        ));
  }
}
