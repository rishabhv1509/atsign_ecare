import 'dart:io';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/searchbar.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditDoctorProfile extends StatefulWidget {
  @override
  _EditDoctorProfileState createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  double _currentSliderValue = 10;
  bool onChoose = true;
  File _image;
  String phoneNumber;
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();

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
          title: TextStrings().profileSetting,
          trailingButtonAction: () {
            Navigator.pushNamed(context, Routes.CONSULTATION);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 20.toHeight, bottom: 25.toHeight),
                        width: 190.toWidth,
                        height: 190.toWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xffF7F9FD),
                        ),
                        child: _image != null
                            ? ClipOval(
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: Icon(
                                  Icons.person,
                                  color: themeData.colorScheme.secondaryVariant,
                                  size: 85.toFont,
                                ),
                              ),
                      ),
                      Positioned(
                          right: 65.toWidth,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 30.toWidth,
                            backgroundColor: themeData.colorScheme.background,
                            child: InkWell(
                              onTap: () async {
                                // ignore: deprecated_member_use
                                String image = (await _picker.getImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 30,
                                ))
                                    .path;
                                if (image != null) {
                                  setState(() {
                                    _image = File(image);
                                  });
                                  // uploadPic(_image, "doctor-profile");
                                }
                              },
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: themeData.colorScheme.primary,
                                  size: 35.toFont,
                                ),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              SpaceBox(50),
              titleText(title: TextStrings().profileDetails),
              contentPadding(
                  child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Type..',
                  hintStyle: CustomTextStyle.chatLabel,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: BorderSide(
                      color: ColorConstants.greyIconColor,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: BorderSide(
                      color: ColorConstants.greyIconColor,
                      width: 1.0,
                    ),
                  ),
                ),
                maxLines: 3,
              )),
              titleText(title: TextStrings().specialityTitle),
              customChip(chipText: 'Surgery'),
              titleText(title: TextStrings().experienceTitle),
              sliderComponent(sliderTitle: '2 years'),
              titleText(title: TextStrings().availabletSlot),
              customChip(chipText: 'Monday'),
              titleText(title: TextStrings().availabletTimeSlot),
              customChip(chipText: '10 AM - 11 AM'),
              titleText(title: TextStrings().price),
              sliderComponent(sliderTitle: '\$ 750'),
              titleText(title: TextStrings().yourLocation),
              Container(
                margin: EdgeInsets.only(bottom: 60.toHeight),
                child: LocationSearchBar(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80.toHeight),
                child: CustomButton(
                  width: 600.toWidth,
                  buttonText: TextStrings().buttonSubmit,
                  onTap: () {},
                ),
              )
            ],
          ),
        ));
  }

  Widget titleText({String title}) {
    return contentPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyle.appBarTitleStyle,
          ),
        ],
      ),
    );
  }

  Widget contentPadding({Widget child}) {
    return CustomPadding(
      top: 40.0.toHeight,
      left: 50.0.toWidth,
      right: 50.toWidth,
      child: child,
    );
  }

  Widget customChip({String chipText, Function onTap}) {
    return contentPadding(
        child: Container(
      width: SizeConfig().screenWidth,
      height: 80.toHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.toWidth, vertical: 10.toHeight),
              child: InkWell(
                onTap: () {
                  setState(() {
                    onChoose = !onChoose;
                  });
                },
                child: Chip(
                  label: Text(chipText),
                  labelStyle: onChoose
                      ? CustomTextStyle.subTitleStyle
                      : CustomTextStyle.customButtonTextStyle,
                  backgroundColor: onChoose
                      ? Color(0xffF7F9FD)
                      : themeData.colorScheme.primary,
                ),
              ));
        },
      ),
    ));
  }

  Widget sliderComponent({String sliderTitle}) {
    return contentPadding(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: SizeConfig().screenWidth / 1.4,
          child: SliderTheme(
            data: SliderThemeData(
                trackHeight: 8.toHeight,
                disabledActiveTickMarkColor: ColorConstants.sliderColor,
                activeTrackColor: themeData.colorScheme.primary,
                inactiveTrackColor: ColorConstants.sliderColor,
                thumbColor: themeData.colorScheme.background),
            child: Slider(
              value: _currentSliderValue,
              min: 0,
              max: 200,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
        ),
        Text(
          sliderTitle,
          style: CustomTextStyle.cardTextStyle,
        ),
      ],
    ));
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorPage(String message) {
    return Center(
      child: Text(message),
    );
  }
}
