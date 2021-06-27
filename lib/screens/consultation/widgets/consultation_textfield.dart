import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class ConsultationTextField extends StatefulWidget {
  @override
  _ConsultationTextFieldState createState() => _ConsultationTextFieldState();
}

class _ConsultationTextFieldState extends State<ConsultationTextField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          left: 30.toWidth,
          right: 30.toWidth,
          bottom: 30.toHeight,
          top: 30.toHeight),
      width: SizeConfig().screenWidth,
      height: 50.toHeight,
      child: TextField(),
    );
  }
}
