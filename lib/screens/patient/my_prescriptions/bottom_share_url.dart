import 'dart:async';

import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetUrl extends StatefulWidget {
  final String url;
  BottomSheetUrl({Key key, @required this.url}) : super(key: key);

  @override
  _BottomSheetUrlState createState() => _BottomSheetUrlState();
}

class _BottomSheetUrlState extends State<BottomSheetUrl> {
  String buttonText = "Copy Url";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 420.toHeight,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Unique Link",
            style: TextStyle(
              fontSize: 40.toFont,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40.toHeight),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await canLaunch(widget.url)
                    ? await launch(widget.url)
                    : throw "Cannot launch";
              },
              child: Center(
                child: Text(
                  widget.url,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 30.toFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  buttonText: buttonText,
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: widget.url));
                    setState(() {
                      buttonText = "Copied";
                    });
                    Timer(Duration(seconds: 2), () {
                      Navigator.of(context).pop();
                    });
                  }),
            ],
          ),
          SizedBox(height: 40.toHeight),
        ],
      ),
    );
  }
}
