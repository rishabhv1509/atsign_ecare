import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class PastConsultation extends StatefulWidget {
  @override
  _PastConsultationState createState() => _PastConsultationState();
}

class _PastConsultationState extends State<PastConsultation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig().screenWidth,
      color: ColorConstants.secondaryDarkAppColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 250.toWidth,
            backgroundColor: ColorConstants.secondaryDarkAppColor,
            child: Center(
              child: Image.asset(
                AllImages().pastConsultation,
              ),
            ),
          ),
          Text(
            TextStrings().pastConsultation,
            textAlign: TextAlign.center,
            style: CustomTextStyle.cardTextStyle,
          ),
          SpaceBox(450.toHeight),
          CustomPadding(
            bottom: 100,
            child: CustomButton(
              width: 580.toWidth,
              buttonText: TextStrings().bookAppointment,
              onTap: () {
                Navigator.pushNamed(context, Routes.BOOKAPPOINTMENT);
              },
            ),
          ),
        ],
      ),
    );
  }
}
