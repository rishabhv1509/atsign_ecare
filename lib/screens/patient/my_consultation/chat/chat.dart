import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/chat_appbar.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/chat_input_widget.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/receive_message.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/send_message.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ChatAppBar(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SendMessage(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RecieveMessage(),
            ],
          )
        ],
      )),
      bottomNavigationBar: ChatInput(),
    );
  }
}
