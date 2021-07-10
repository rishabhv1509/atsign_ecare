import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class FabButton extends StatefulWidget {
  final Function onTap;
  final Function onLongPress;
  final String transcription;
  final bool listening;
  FabButton({this.onTap, this.onLongPress, this.transcription, this.listening});
  @override
  _FabButtonState createState() => _FabButtonState();
}

class _FabButtonState extends State<FabButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onLongPress: () {
        print("long pressed");
        widget.onLongPress();
      },
      child: Container(
        height: 120,
        width: 300,
        margin: EdgeInsets.all(16),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.transcription != '')
              new Center(
                child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        widget.transcription ?? '',
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            Center(
              child: CircleAvatar(
                  backgroundColor: ColorConstants.logoBg,
                  radius: 35,
                  child: Icon(
                    widget.listening == null || widget.listening == false
                        ? Icons.settings_voice
                        : Icons.more_horiz,
                    // color: activated?C:secondaryAppColor,
                  )
                  //    Image.asset(
                  //     AllImages().fabIcon,
                  //     width: 68.toWidth,
                  //     height: 68.toHeight,
                  //   ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
