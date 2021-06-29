import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/health_checkup/widgets/diagnostic_center_card.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DiagnosticCenter extends StatefulWidget {
  @override
  _DiagnosticCenterState createState() => _DiagnosticCenterState();
}

class _DiagnosticCenterState extends State<DiagnosticCenter> {
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
        title: TextStrings().diagnosticCenter,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30.toHeight),
        width: SizeConfig().screenWidth,
        height: SizeConfig().screenHeight,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return DiagnosticCenterCard(
              diagnosticImage: AllImages().diagnosticCenter,
              diagnosticName: 'Medall Clumax Diagnostics',
              diagnosticDesignation: 'MD, Neurology',
              diagnosticTiming: 'Open : 10AM - 09PM',
              diagnosticContact: '+91 8904871491',
              diagnosticCharge: '\$230',
              diagnosticRating: '3.0',
            );
          },
        ),
      ),
    );
  }
}
