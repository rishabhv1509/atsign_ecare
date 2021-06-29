import 'package:at_chat_flutter/utils/init_chat_service.dart';
import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class UpcomingConsultation extends StatefulWidget {
  @override
  _UpcomingConsultationState createState() => _UpcomingConsultationState();
}

class _UpcomingConsultationState extends State<UpcomingConsultation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          top: 40.toHeight, left: 30.toWidth, right: 30.toWidth),
      width: SizeConfig().screenWidth,
      height: 300.toHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
        ],
        color: ColorConstants.secondaryDarkAppColor,
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              CustomPadding(
                top: 5,
                left: 10,
                child: CircleAvatar(
                  radius: 75.toWidth,
                  backgroundColor: ColorConstants.logoBg,
                  child: CircleAvatar(
                    radius: 70.toWidth,
                    backgroundImage: AssetImage(AllImages().videoCallDoctor),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPadding(
                    top: 25,
                    left: 50,
                    child: Row(
                      children: [
                        customContact(Icons.messenger, () {
                          BackendService _backendService =
                              BackendService.getInstance();
                          initializeChatService(
                              _backendService.atClientInstance,
                              _backendService.currentAtSign);
                          Navigator.pushNamed(context, Routes.CHAT,
                              arguments: {'chatWith': '@junglegreen16inc'});
                        }),
                        customContact(Icons.phone, () {
                          Navigator.pushNamed(context, Routes.VIDEOCALL);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20.toWidth),
            width: SizeConfig().screenWidth - 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 50,
                      child: Text(
                        'Robert Kilm',
                        style: CustomTextStyle.appBarTitleStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 10,
                      child: Text(
                        'MD, Neurology',
                        style: CustomTextStyle.subTitleStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomPadding(
                      top: 20,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: ColorConstants.grey,
                        size: 40.toFont,
                      ),
                    ),
                    CustomPadding(
                      top: 20,
                      left: 20,
                      child: Text(
                        '25 September 2020',
                        style: CustomTextStyle.paymentProfileCard,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomPadding(
                      top: 20,
                      child: Icon(
                        Icons.timer,
                        color: ColorConstants.grey,
                        size: 40.toFont,
                      ),
                    ),
                    CustomPadding(
                      top: 20,
                      left: 20,
                      child: Text(
                        '03:00 PM  -  04 PM ',
                        style: CustomTextStyle.paymentProfileCard,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customContact(IconData icon, Function onTap) {
    return Container(
      margin: EdgeInsets.only(right: 40.toWidth),
      width: 60.toWidth,
      height: 60.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
          ]),
      child: Center(
          child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        color: ColorConstants.logoBg,
      )),
    );
  }
}
