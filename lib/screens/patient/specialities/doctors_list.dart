import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/widgets/choose_doctor_card.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatefulWidget {
  final String speciality;

  const DoctorsList({Key key, @required this.speciality}) : super(key: key);
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  List<Doctor> doctors = [];

  @override
  void initState() {
    super.initState();
    MixedConstants.doctors.forEach((doc) {
      if (doc.speciality == widget.speciality) doctors.add(doc);
    });
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
        title: widget.speciality,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Column(
        children: <Widget>[
          CustomPadding(
            top: 50.0,
            left: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  TextStrings().availableDoctors,
                  style: CustomTextStyle.titleTextStyle,
                ),
              ],
            ),
          ),
          CustomPadding(
            top: 20.0,
            left: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${doctors.length.toString()} available",
                  style: CustomTextStyle.questionTitle,
                ),
              ],
            ),
          ),
          Container(
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenHeight / 1.3,
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (BuildContext context, int index) {
                return DoctorCard(
                  doctor: doctors[0],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
