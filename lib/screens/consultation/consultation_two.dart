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

class ConsultationTwo extends StatefulWidget {
  @override
  _ConsultationTwoState createState() => _ConsultationTwoState();
}

class _ConsultationTwoState extends State<ConsultationTwo> {
  double _currentSliderValue = 2;
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
                    TextStrings().ageQuestion,
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
                      "2 of 4",
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
                            optionText: TextStrings().under16,
                            showSubTitle: false,
                            isSelected: selectedIndex == 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          child: QuestionTextFormField(
                            optionText: TextStrings().sixteento25,
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
                            optionText: TextStrings().twentysixto50,
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
                            optionText: TextStrings().fiftyoneto65,
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
                            optionText: TextStrings().over65,
                            showSubTitle: false,
                            isSelected: selectedIndex == 4,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomNavButton(
                    prevButton: () {
                      Navigator.pop(context);
                    },
                    nextButton: () {
                      Navigator.pushNamed(context, Routes.CONSULTATIONTHREE);
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

  Widget padding(Widget child) {
    return CustomPadding(
        top: 20.toHeight,
        bottom: 20.toHeight,
        right: 30.toWidth,
        left: 30.toWidth,
        child: child);
  }
}
