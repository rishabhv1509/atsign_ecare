import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/widgets/choose_doctor_card.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class Gynecologist extends StatefulWidget {
  @override
  _GynecologistState createState() => _GynecologistState();
}

class _GynecologistState extends State<Gynecologist> {
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
        title: TextStrings().gynecologist,
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
                  TextStrings().noofDoctors,
                  style: CustomTextStyle.questionTitle,
                ),
              ],
            ),
          ),
          Container(
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenHeight / 1.3,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return DoctorCard(
                  doctor: MixedConstants.doctors[0],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
