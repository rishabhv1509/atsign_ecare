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

class DoctorProfile extends StatefulWidget {
  final String specialistImage;
  final String specialistName;
  final String specialistDesignation;
  final String specialistDescription;
  final String specialistRating;
  final String specialistCharge;
  DoctorProfile(
      {this.specialistImage,
      this.specialistName,
      this.specialistDesignation,
      this.specialistDescription,
      this.specialistRating,
      this.specialistCharge});
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
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
        title: TextStrings().profile,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.toHeight, left: 30.toWidth),
            width: SizeConfig().screenWidth,
            height: 450.toHeight,
            color: ColorConstants.secondaryDarkAppColor,
            child: Row(
              children: <Widget>[
                Container(
                  width: 220.toWidth,
                  height: 450.toHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AllImages().doctorProfile),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.toWidth),
                  width: SizeConfig().screenWidth - 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomPadding(
                            top: 50,
                            child: Text(
                              widget.specialistName,
                              style: CustomTextStyle.appBarTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomPadding(
                            top: 10,
                            child: Text(
                              widget.specialistDesignation,
                              style: CustomTextStyle.subTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomPadding(
                            top: 10,
                            child: Text(
                              widget.specialistDescription,
                              style: CustomTextStyle.grey26,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15.toHeight),
                            width: 250.toWidth,
                            height: 54.toHeight,
                            decoration: BoxDecoration(
                              color: ColorConstants.logoBg,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                '\$230 / per hour',
                                style: CustomTextStyle.whiteBold26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      widget.specialistRating,
                                      style: CustomTextStyle.ratingStyle,
                                    ),
                                  ),
                                  CustomPadding(
                                      left: 20.toWidth,
                                      child: VerticalDivider(
                                        color: ColorConstants.grey,
                                      )),
                                  CustomPadding(
                                    left: 20.toWidth,
                                    child: Text(
                                      '284 Reviews',
                                      style: CustomTextStyle.reviewStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomPadding(
                            top: 25,
                            child: Row(
                              children: [
                                customContact(Icons.messenger, () {}),
                                customContact(Icons.phone, () {}),
                                customContact(Icons.location_on, () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 10.toHeight, left: 30.toWidth, right: 30.toWidth),
              width: SizeConfig().screenWidth,
              height: 450.toHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.secondaryDarkAppColor,
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.unselectedBoxShadow,
                        blurRadius: 15)
                  ]),
              child: Column(
                children: [
                  Container(
                    height: 150.toHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TabBar(
                          isScrollable: true,
                          onTap: (index) {
                            if (index == 0) {}
                            if (index == 1) {}
                          },
                          labelPadding: EdgeInsets.all(20),
                          labelColor: ColorConstants.headingText,
                          unselectedLabelColor: ColorConstants.grey,
                          indicatorWeight: 5.toHeight,
                          indicatorColor: ColorConstants.logoBg,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: CustomTextStyle.appBarTitleStyle,
                          unselectedLabelStyle: CustomTextStyle.ratingStyle,
                          controller: _controller,
                          tabs: [
                            Text(
                              TextStrings().about,
                            ),
                            Text(
                              TextStrings().specialization,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        tabContent(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer'),
                        tabContent(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer'),
                      ],
                    ),
                  )
                ],
              )),
          SpaceBox(200.toHeight),
          CustomButton(
            width: 600.toWidth,
            buttonText: TextStrings().bookAppointment,
            onTap: () {
              Navigator.pushNamed(context, Routes.BOOKAPPOINTMENT);
            },
          ),
        ],
      ),
    );
  }

  Widget tabContent(String tabContent) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        tabContent,
        textAlign: TextAlign.justify,
        style: CustomTextStyle.grey26,
      ),
    );
  }

  Widget customContact(IconData icon, Function onTap) {
    return Container(
      margin: EdgeInsets.only(right: 25.toWidth),
      width: 70.toWidth,
      height: 70.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
          ]),
      child: Center(
          child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        color: ColorConstants.logoBg,
      )),
    );
  }
}
