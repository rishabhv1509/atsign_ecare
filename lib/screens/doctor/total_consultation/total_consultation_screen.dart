import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class TotalConsulationScreen extends StatefulWidget {
  @override
  _TotalConsulationScreenState createState() => _TotalConsulationScreenState();
}

class _TotalConsulationScreenState extends State<TotalConsulationScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: TextStrings().totatConsultation,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 98.toHeight,
          horizontal: 44.toWidth,
        ),
        height: 430.toHeight,
        width: 627.toWidth,
        // color: ColorConstants.sliderColor,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0),
          ),
          boxShadow: [
            BoxShadow(
              color: themeData.colorScheme.primaryVariant,
              offset: const Offset(
                2.0,
                2.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: CustomPadding(
          bottom: 20,
          top: 50,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  AllImages().consultationTick,
                ),
                width: 130.toWidth,
              ),
              SizedBox(height: 40.toHeight),
              Text(
                TextStrings().totatConsultation,
                style: CustomTextStyle.appBarTitleStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.toHeight),
              Text(TextStrings().totatConsultationNumber,
                  style: CustomTextStyle.appBarTitleStyle
                      .copyWith(fontSize: 40.toFont))
            ],
          ),
        ),
      ),
    );
  }
}
