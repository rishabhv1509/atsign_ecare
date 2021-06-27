import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          left: 30.toWidth, right: 30.toWidth, bottom: 80.toHeight),
      width: SizeConfig().screenWidth,
      height: 100.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
          ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.toWidth, top: 10.toWidth),
            width: 400.toWidth,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: TextStrings().typeamessage,
                  hintStyle: CustomTextStyle.chatLabel),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.attach_file_outlined,
                color: ColorConstants.chatLabel,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: ColorConstants.chatLabel,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
