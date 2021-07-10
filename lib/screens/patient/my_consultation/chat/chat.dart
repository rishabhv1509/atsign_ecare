import 'package:at_chat_flutter/at_chat_flutter.dart';
import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/controllers/initialization_controller.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/chat_appbar.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/chat/chat_input_widget.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String chatWith;

  const Chat({Key key, this.chatWith}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    setChatWithAtSign('@adorabledinosaur', isGroup: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ChatAppBar(),
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
