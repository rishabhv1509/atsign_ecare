import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/doctor/profile/doctor_profile.dart';
import 'package:atsign_ecare/services/notification_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/carousel_sliders_item.dart';
import 'package:atsign_ecare/widgets/category_card.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  final String userType;
  final String phoneNumber;

  DoctorHomeScreen({this.userType, this.phoneNumber});
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _current;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
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
            ElevatedButton(
                onPressed: () {
                  NotificationService().showNotification('from');
                },
                child: Text('press me')),
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
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.BOOKINGS);
                          },
                          cardIcon: AllImages().booking,
                          cardTitle: TextStrings().booking,
                        ),
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.PATIENTLIST);
                          },
                          cardIcon: AllImages().messages,
                          cardTitle: TextStrings().message,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.TOTALCONSULTATION);
                          },
                          cardIcon: AllImages().consultationIcon,
                          cardTitle: TextStrings().totalConsultation,
                        ),
                        CategoryCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DoctorProfileScreen(
                                  phoneNumber: widget.phoneNumber,
                                  userType: widget.userType,
                                ),
                              ),
                            );
                          },
                          cardIcon: AllImages().profile,
                          cardTitle: TextStrings().profile,
                        )
                      ],
                    ),
                    SpaceBox(20.toHeight),
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index, int i) {
                          return CarouselSliderItem();
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
                                ? themeData.colorScheme.primary
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
