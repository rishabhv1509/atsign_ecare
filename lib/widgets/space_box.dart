import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpaceBox extends StatelessWidget {
  double height;
  SpaceBox(this.height);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: height.toHeight,
    );
  }
}
