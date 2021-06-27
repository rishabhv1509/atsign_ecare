import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class PaymentCompleted extends StatefulWidget {
  @override
  _PaymentCompletedState createState() => _PaymentCompletedState();
}

class _PaymentCompletedState extends State<PaymentCompleted> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          rowCenter(
            [
              CircleAvatar(
                radius: 100.toWidth,
                backgroundColor: ColorConstants.logoBg,
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: ColorConstants.secondaryDarkAppColor,
                  size: 140.toFont,
                )),
              )
            ],
          ),
          SpaceBox(50),
          Text(
            TextStrings().congratulation,
            textAlign: TextAlign.center,
            style: CustomTextStyle.titleTextStyle,
          ),
          SpaceBox(50),
          Container(
            margin: EdgeInsets.only(left: 100.toWidth, right: 100.toWidth),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: CustomTextStyle.paymentComplete,
                children: <TextSpan>[
                  TextSpan(text: TextStrings().bookingScheduled),
                  TextSpan(
                      text: '\tDr. Robert Klim',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SpaceBox(50),
          rowCenter([
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
            )
          ]),
          rowCenter([
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
            )
          ]),
          SpaceBox(300),
          CustomButton(
            buttonText: TextStrings().viewScheduled,
            onTap: () {
              Navigator.pushNamed(context, Routes.HOMESCREEN);
            },
          ),
          SpaceBox(92),
        ],
      ),
    );
  }

  Widget rowCenter(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: child,
    );
  }
}
