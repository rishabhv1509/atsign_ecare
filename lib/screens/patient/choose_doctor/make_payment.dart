import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
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
                  backgroundImage: AssetImage(AllImages().videoCallDoctor),
                ),
              )
              // Container(
              //   width: 250.toWidth,
              //   height: 250.toHeight,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage(
              //             AllImages().doctorIcon,
              //           ),
              //           fit: BoxFit.cover),
              //       borderRadius: BorderRadius.circular(100),
              //       border: Border.all(color: ColorConstants.logoBg, width: 3),
              //       color: ColorConstants.secondaryDarkAppColor),
              // )
            ],
          ),
          SpaceBox(50),
          Text(
            'Robert Klim',
            textAlign: TextAlign.center,
            style: CustomTextStyle.titleTextStyle,
          ),
          SpaceBox(10),
          Container(
            margin: EdgeInsets.only(left: 100.toWidth, right: 100.toWidth),
            child: Text(
              'MD, Neurology',
              textAlign: TextAlign.center,
              style: CustomTextStyle.subTitleStyle,
            ),
          ),
          SpaceBox(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPadding(
                top: 15,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 35.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 35.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 35.toFont,
                      color: ColorConstants.starColor,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 35.toFont,
                      color: ColorConstants.grey,
                    ),
                    CustomPadding(
                      left: 20.toWidth,
                      child: Text(
                        '3.0',
                        style: CustomTextStyle.ratingStyle,
                      ),
                    ),
                    CustomPadding(
                        left: 20.toWidth,
                        child: VerticalDivider(
                          color: ColorConstants.grey,
                        )),
                  ],
                ),
              ),
            ],
          ),
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
                          '25 November 2020',
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
                          '03 PM - 04 PM',
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
                          'Total Amount : \$244',
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
              Navigator.pushNamed(context, Routes.PAYMENT);
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
