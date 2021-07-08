import 'dart:convert';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/consultation.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/shared_preferences_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class PaymentCompleted extends StatefulWidget {
  final Consultation consultation;

  const PaymentCompleted({Key key, @required this.consultation})
      : super(key: key);
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
                      text: '\t${widget.consultation.doctor.name}',
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
                "${widget.consultation.date.day < 9 ? "0" + widget.consultation.date.day.toString() : widget.consultation.date.day} ${getMonth(widget.consultation.date.month)} ${widget.consultation.date.year}",
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
                widget.consultation.timeSlot,
                style: CustomTextStyle.paymentProfileCard,
              ),
            )
          ]),
          SpaceBox(300),
          CustomButton(
            buttonText: "View Schedules",
            onTap: () async {
              String rawData = await SharedPreferenceService.getData(
                  SharedPrefConstant.Consultation);
              List<dynamic> prevConsultations = [];
              if (rawData == "") {
                prevConsultations.add(widget.consultation.toJson());
              } else {
                prevConsultations = jsonDecode(rawData);
                prevConsultations.insert(0, widget.consultation.toJson());
              }
              await SharedPreferenceService.setData(
                  SharedPrefConstant.Consultation,
                  jsonEncode(prevConsultations));
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

  String getMonth(i) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[i + 1];
  }
}
