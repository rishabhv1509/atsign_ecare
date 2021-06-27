import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class Specialities extends StatefulWidget {
  @override
  _SpecialitiesState createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities>
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
        title: TextStrings().specialitiesTitle,
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
                          TextStrings().specialitiesTitle,
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
                          TextStrings().superspecialities,
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
                  Padding(
                    padding: EdgeInsets.only(top: 40.toHeight),
                    child: ListView(
                      children: <Widget>[
                        specialitiesListTile(
                            leadingIcon: AllImages().gynecologist,
                            specialitiesTitle: TextStrings().gynecologist,
                            trailingAction: () {
                              Navigator.pushNamed(context, Routes.GYNOCOLOGIST);
                            }),
                        specialitiesListTile(
                            leadingIcon: AllImages().physician,
                            specialitiesTitle: TextStrings().physician,
                            trailingAction: () {}),
                        specialitiesListTile(
                            leadingIcon: AllImages().orthopedician,
                            specialitiesTitle: TextStrings().orthopedician,
                            trailingAction: () {}),
                        specialitiesListTile(
                            leadingIcon: AllImages().dietician,
                            specialitiesTitle: TextStrings().dietician,
                            trailingAction: () {}),
                        specialitiesListTile(
                            leadingIcon: AllImages().childrensHealth,
                            specialitiesTitle: TextStrings().childrensHealth,
                            trailingAction: () {}),
                        specialitiesListTile(
                            leadingIcon: AllImages().skinHair,
                            specialitiesTitle: TextStrings().skinHair,
                            trailingAction: () {}),
                        specialitiesListTile(
                            leadingIcon: AllImages().mentalWellness,
                            specialitiesTitle: TextStrings().mentalWellness,
                            trailingAction: () {}),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig().screenWidth,
                    height: SizeConfig().screenHeight,
                    color: ColorConstants.secondaryDarkAppColor,
                  )
                ]),
          )
        ],
      ),
    );
  }

  Widget specialitiesListTile(
      {String leadingIcon, String specialitiesTitle, Function trailingAction}) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 30.toWidth),
      padding:
          EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 10.toWidth),
      decoration: BoxDecoration(
          color: ColorConstants.secondaryDarkAppColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
          ]),
      child: ListTile(
        leading: Image.asset(leadingIcon),
        title: Text(
          specialitiesTitle,
          style: CustomTextStyle.cardTextStyle,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: ColorConstants.headingText,
          ),
          onPressed: trailingAction,
        ),
      ),
    );
  }
}
