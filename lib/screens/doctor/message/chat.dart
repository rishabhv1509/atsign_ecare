import 'package:at_chat_flutter/at_chat_flutter.dart';
import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/screens/doctor/message/chat_appbar.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class DoctorChat extends StatefulWidget {
  final String chatWith;

  const DoctorChat({Key key, this.chatWith}) : super(key: key);
  @override
  _DoctorChatState createState() => _DoctorChatState();
}

class _DoctorChatState extends State<DoctorChat> {
  @override
  void initState() {
    setChatWithAtSign('@junglegreen16inc', isGroup: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: DoctorChatAppBar(),
      ),
      body: ChatScreen(
        height: SizeConfig().screenHeight,
        incomingMessageColor: Colors.blue[100],
        outgoingMessageColor: Colors.green[100],
        isScreen: true,
      ),
      // bottomNavigationBar: ChatInput(),
    );
  }
}
