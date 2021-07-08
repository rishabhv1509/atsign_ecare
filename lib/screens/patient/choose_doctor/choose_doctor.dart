import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/widgets/choose_doctor_card.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/fab.dart';
import 'package:flutter/material.dart';

class ChooseDoctor extends StatefulWidget {
  @override
  _ChooseDoctorState createState() => _ChooseDoctorState();
}

class _ChooseDoctorState extends State<ChooseDoctor> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      floatingActionButton: FabButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(
        leadingIcon: Icons.search,
        elevation: 2,
        showLeadingicon: true,
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
                  TextStrings().chooseDoctorTitle,
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
            height: SizeConfig().screenHeight - 300,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return DoctorCard(doctor: MixedConstants.doctors[0]);
              },
            ),
          )
        ],
      ),
    );
  }
}
