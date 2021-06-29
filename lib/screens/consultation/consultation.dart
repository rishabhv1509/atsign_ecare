import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/consultation/widgets/custom_nav_button.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/question_textfield.dart';
import 'package:flutter/material.dart';

class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.appbarColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        backgroundColor: ColorConstants.appbarColor,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTrailingicon: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomPadding(
              top: 20.0,
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextStrings().consultationone,
                    style: CustomTextStyle.titleTextStyle,
                  ),
                ],
              ),
            ),
            CustomPadding(
                top: 100.0,
                left: 35.0,
                right: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      TextStrings().questions,
                      style: CustomTextStyle.questionTitle,
                    ),
                    Text(
                      TextStrings().section,
                      style: CustomTextStyle.questionTitle,
                    ),
                  ],
                )),
            SliderTheme(
              data: SliderThemeData(
                  trackHeight: 10.toHeight,
                  disabledActiveTickMarkColor: ColorConstants.sliderColor,
                  activeTrackColor: ColorConstants.logoBg,
                  inactiveTrackColor: ColorConstants.sliderColor,
                  thumbColor: ColorConstants.secondaryDarkAppColor),
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 4,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.toHeight),
              width: SizeConfig().screenWidth,
              height: SizeConfig().screenHeight,
              decoration: BoxDecoration(
                  color: ColorConstants.secondaryDarkAppColor,
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.indicatorColor, blurRadius: 2)
                  ]),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25.toHeight),
                    width: SizeConfig().screenWidth,
                    height: 650.toHeight,
                    child: Column(
                      children: <Widget>[
                        QuestionTextFormField(
                          optionText: TextStrings().mySelf,
                          showSubTitle: false,
                        ),
                        QuestionTextFormField(
                          optionText: TextStrings().father,
                          showSubTitle: false,
                        ),
                        QuestionTextFormField(
                          optionText: TextStrings().mother,
                          showSubTitle: false,
                        ),
                        QuestionTextFormField(
                          optionText: TextStrings().wife,
                          showSubTitle: false,
                        ),
                        QuestionTextFormField(
                          optionText: TextStrings().sonanddaughter,
                          showSubTitle: false,
                        )
                      ],
                    ),
                  ),
                  CustomNavButton(
                    prevButton: () {
                      Navigator.pop(context);
                    },
                    nextButton: () {
                      Navigator.pushNamed(context, Routes.CONSULTATIONTWO);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
