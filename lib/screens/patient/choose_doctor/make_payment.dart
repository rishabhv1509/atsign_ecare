import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/consultation.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class MakePayment extends StatefulWidget {
  final Consultation consultation;

  const MakePayment({Key key, @required this.consultation}) : super(key: key);
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: TextStrings().makePayment,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          rowCenter(
            [
              CircleAvatar(
                radius: 100.toWidth,
                backgroundColor: ColorConstants.logoBg,
                child: CircleAvatar(
                  radius: 95.toWidth,
                  backgroundImage:
                      NetworkImage(widget.consultation.doctor.profileImagePath),
                ),
              )
            ],
          ),
          SpaceBox(50),
          Text(
            widget.consultation.doctor.name,
            textAlign: TextAlign.center,
            style: CustomTextStyle.titleTextStyle,
          ),
          SpaceBox(10),
          Container(
            margin: EdgeInsets.only(left: 100.toWidth, right: 100.toWidth),
            child: Text(
              widget.consultation.doctor.speciality,
              textAlign: TextAlign.center,
              style: CustomTextStyle.subTitleStyle,
            ),
          ),
          SpaceBox(10),
          Container(
            margin: EdgeInsets.only(
                top: 100.toHeight, left: 30.toWidth, right: 30.toWidth),
            width: SizeConfig().screenWidth / 1.35,
            height: 230.toHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorConstants.secondaryDarkAppColor,
                boxShadow: [
                  BoxShadow(
                      color: ColorConstants.unselectedBoxShadow, blurRadius: 6)
                ]),
            child: Column(
              children: <Widget>[
                CustomPadding(
                  top: 30,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today_outlined,
                        color: ColorConstants.grey,
                        size: 40.toFont,
                      ),
                      CustomPadding(
                        left: 20,
                        child: Text(
                          "${widget.consultation.date.day < 9 ? "0" + widget.consultation.date.day.toString() : widget.consultation.date.day} ${getMonth(widget.consultation.date.month)} ${widget.consultation.date.year}",
                          style: CustomTextStyle.paymentProfileCard,
                        ),
                      )
                    ],
                  ),
                ),
                CustomPadding(
                  top: 20,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: ColorConstants.grey,
                        size: 40.toFont,
                      ),
                      CustomPadding(
                        left: 20,
                        child: Text(
                          widget.consultation.timeSlot,
                          style: CustomTextStyle.paymentProfileCard,
                        ),
                      )
                    ],
                  ),
                ),
                CustomPadding(
                  top: 20,
                  left: 38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '\$',
                        style: TextStyle(
                            color: ColorConstants.grey,
                            fontSize: 40.toFont,
                            fontWeight: FontWeight.w500),
                      ),
                      CustomPadding(
                        left: 23,
                        child: Text(
                          'Total Amount : \$${widget.consultation.doctor.pricePerHour.toInt().toString()}',
                          style: CustomTextStyle.paymentProfileCard,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SpaceBox(150),
          CustomButton(
            buttonText: TextStrings().makePayment,
            onTap: () {
              Navigator.pushNamed(context, Routes.PAYMENT,
                  arguments: {"consultation": widget.consultation});
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
