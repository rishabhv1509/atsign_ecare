import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchScreen extends StatefulWidget {
  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterSwitch(
            height: 50.0.toHeight,
            width: 80.0.toWidth,
            padding: 4.0,
            toggleSize: 22.0,
            borderRadius: 15.0,
            activeColor: themeData.colorScheme.primary,
            value: isSwitched,
            onToggle: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ]);
  }
}
