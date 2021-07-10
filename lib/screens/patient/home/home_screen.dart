import 'dart:convert';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/models/patient.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/shared_preferences_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/carousel_sliders_item.dart';
import 'package:atsign_ecare/widgets/category_card.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/fab.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String userType;
  final String phoneNumber;
  HomeScreen({this.userType, this.phoneNumber});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchCtrl = TextEditingController();
  int _current;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
  ];
  Patient patient;

  @override
  void initState() {
    super.initState();
  }

  getData() async {
    var data =
        await SharedPreferenceService.getData(SharedPrefConstant.PatientData);
    patient = Patient.fromJson(json.decode(data));
    print(patient.name);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      floatingActionButton: FabButton(
        onTap: () {
          Navigator.pushNamed(context, Routes.CHOOSEDOCTOR);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(
        elevation: 2,
        showLeadingicon: false,
        title: TextStrings().buttonExplore,
        showTitle: true,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  top: 20.toHeight,
                  bottom: 11.toHeight,
                  left: 12.toWidth,
                  right: 12.toWidth,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextFormField(
                              showPrefixIcon: false,
                              controller: _searchCtrl,
                              keyboardType: TextInputType.text,
                              hintText: "Search Doctor",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.SEARCHRESULT,
                              arguments: {"searchString": _searchCtrl.text},
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.logoBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.search,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SpaceBox(50.toHeight),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.SPECIALITIES);
                          },
                          cardIcon: AllImages().specialistIcon,
                          cardTitle: TextStrings().specialities,
                        ),
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.MYCONSULTATION,
                                arguments: {
                                  'chatWithAtSign': '@junglegreen16inc'
                                });
                          },
                          cardIcon: AllImages().consultationIcon,
                          cardTitle: TextStrings().consultation,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.AIANALYSISSCREEN,
                            );
                          },
                          cardIcon: AllImages().ai,
                          cardTitle: "AI Analysis",
                        ),
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.MYPRESCRIPTIONS,
                            );
                          },
                          cardIcon: AllImages().prescriptionAlt,
                          cardTitle: "My Prescriptions",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.MEDICATIONREMINDERS,
                            );
                          },
                          cardIcon: AllImages().notifications,
                          cardTitle: "Medication Reminders",
                        ),
                      ],
                    ),
                    SpaceBox(20.toHeight),
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index, int x) {
                          return CarouselSliderItem(index: index);
                        },
                        options: CarouselOptions(
                            aspectRatio: 1.9,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((string) {
                        int index = imgList.indexOf(string);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? ColorConstants.logoBg
                                : ColorConstants.indicatorColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
