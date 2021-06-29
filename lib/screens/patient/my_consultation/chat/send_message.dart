import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatefulWidget {
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
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
            color: ColorConstants.logoBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(4))),
        child: Column(
          children: [
            Center(
              child: Text(
                'Hello Doctor, i recently got a full body health checkup done. I wanted to know your opinion regarding some of the in the report.',
                style: CustomTextStyle.sendMessageStyle,
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Text(
                '09:15 PM',
                style: CustomTextStyle.sendMessageStyle,
              ),
            ),
          ],
        ));
  }
}
