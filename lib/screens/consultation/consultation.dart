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
  double _currentSliderValue = 1;
  int selectedIndex = 0;

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
                      "1 of 4",
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
                max: 4,
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          child: QuestionTextFormField(
                            optionText: TextStrings().mySelf,
                            showSubTitle: false,
                            isSelected: selectedIndex == 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                            print("Clicked");
                          },
                          child: QuestionTextFormField(
                            optionText: TextStrings().father,
                            showSubTitle: false,
                            isSelected: selectedIndex == 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          child: QuestionTextFormField(
                            optionText: TextStrings().mother,
                            showSubTitle: false,
                            isSelected: selectedIndex == 2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          child: QuestionTextFormField(
                            optionText: TextStrings().wife,
                            showSubTitle: false,
                            isSelected: selectedIndex == 3,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          child: QuestionTextFormField(
                            optionText: TextStrings().sonanddaughter,
                            showSubTitle: false,
                            isSelected: selectedIndex == 4,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomNavButton(
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
