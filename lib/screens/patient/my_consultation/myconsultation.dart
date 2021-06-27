import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/past_consultation.dart';
import 'package:atsign_ecare/screens/patient/my_consultation/upcoming_consultation.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class MyConsultation extends StatefulWidget {
  @override
  _MyConsultationState createState() => _MyConsultationState();
}

class _MyConsultationState extends State<MyConsultation>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller =
        TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        title: TextStrings().myConsultation,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Column(
        children: <Widget>[
          CustomPadding(
            top: 50,
            left: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.unselectedBoxShadow,
                        blurRadius: 4)
                  ],
                  border:
                      Border.all(color: ColorConstants.secondaryDarkAppColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _controller.animateTo(0);
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: Container(
                      width: SizeConfig().screenWidth / 2.3,
                      height: 85.toHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstants.unselectedBoxShadow,
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                        color: _currentIndex == 0
                            ? ColorConstants.logoBg
                            : ColorConstants.secondaryDarkAppColor,
                      ),
                      child: Center(
                        child: Text(
                          TextStrings().upcoming,
                          style: _currentIndex == 0
                              ? CustomTextStyle.customButtonTextStyle
                              : CustomTextStyle.grey26,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.animateTo(1);
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: Container(
                      width: SizeConfig().screenWidth / 2.3,
                      height: 85.toHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstants.unselectedBoxShadow,
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                        color: _currentIndex == 1
                            ? ColorConstants.logoBg
                            : ColorConstants.secondaryDarkAppColor,
                      ),
                      child: Center(
                        child: Text(
                          TextStrings().past,
                          style: _currentIndex == 1
                              ? CustomTextStyle.customButtonTextStyle
                              : CustomTextStyle.grey26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return UpcomingConsultation();
                      }),
                  PastConsultation(),
                ]),
          )
        ],
      ),
    );
  }
}
