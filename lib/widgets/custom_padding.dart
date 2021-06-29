import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  final Widget child;
  final double top;
  final double bottom;
  final double left;
  final double right;
  CustomPadding(
      {this.child,
      this.bottom = 0.0,
      this.left = 0.0,
      this.right = 0.0,
      this.top = 0.0});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          top: top.toHeight,
          bottom: bottom.toHeight,
          left: left.toWidth,
          right: right.toWidth),
      child: child,
    );
  }
}
