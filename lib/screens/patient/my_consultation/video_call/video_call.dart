import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenHeight,
            decoration: BoxDecoration(
                color: ColorConstants.secondaryDarkAppColor,
                image: DecorationImage(
                    image: AssetImage(AllImages().videoCallDoctor),
                    fit: BoxFit.cover)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 70.toHeight, horizontal: 30.toWidth),
                width: 300.toWidth,
                height: 380.toHeight,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorConstants.secondaryDarkAppColor, width: 4),
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.secondaryDarkAppColor,
                    image: DecorationImage(
                        image: AssetImage(AllImages().videoCallPatient),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPadding(
                  bottom: 20,
                  child: Text(
                    'Robert Kilm',
                    style: CustomTextStyle.titleTextStyle,
                  ),
                ),
                CustomPadding(
                  bottom: 50,
                  child: Text(
                    '09:45:07',
                    style: CustomTextStyle.customButtonTextStyle,
                  ),
                ),
                CustomPadding(
                    bottom: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        callAction(
                            backgroundColor:
                                ColorConstants.secondaryDarkAppColor,
                            icon: Icons.mic_off,
                            iconColor: ColorConstants.black),
                        callAction(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.FEEDBACK);
                            },
                            backgroundColor: ColorConstants.deleteColor,
                            icon: Icons.call_end_outlined,
                            iconColor: ColorConstants.secondaryDarkAppColor),
                        callAction(
                            backgroundColor:
                                ColorConstants.secondaryDarkAppColor,
                            icon: Icons.sync_outlined,
                            iconColor: ColorConstants.black)
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget callAction(
      {Color backgroundColor, IconData icon, Color iconColor, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 60.toHeight, horizontal: 20.toWidth),
        width: 90.toWidth,
        height: 90.toHeight,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.unselectedBoxShadow, blurRadius: 2)
            ]),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: 40.toFont,
          ),
        ),
      ),
    );
  }
}
