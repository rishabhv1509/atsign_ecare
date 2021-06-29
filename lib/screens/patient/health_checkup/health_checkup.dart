import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class HealthCheckup extends StatefulWidget {
  @override
  _HealthCheckupState createState() => _HealthCheckupState();
}

class _HealthCheckupState extends State<HealthCheckup> {
  String selectCheckup = '';
  bool isSelected = false;
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
        title: TextStrings().healthCheckupTitle,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            bottom: 80.toHeight, left: 30.toWidth, right: 30.toWidth),
        child: CustomButton(
          buttonText: TextStrings().buttonDiagnosticCenter,
          onTap: () {
            Navigator.pushNamed(context, Routes.DIAGNOSTICCENTER);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPadding(
              top: 30,
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 10.toHeight, horizontal: 30.toWidth),
                width: SizeConfig().screenWidth,
                height: 100.toHeight,
                decoration: BoxDecoration(
                    color: ColorConstants.secondaryDarkAppColor,
                    boxShadow: [
                      BoxShadow(
                          color: ColorConstants.unselectedBoxShadow,
                          blurRadius: 20)
                    ],
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.search_outlined,
                          color: ColorConstants.grey,
                          size: 40.toFont,
                        ),
                        onPressed: () {}),
                    Container(
                      width: 400.toWidth,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: TextStrings().searchLocation,
                            hintStyle: CustomTextStyle.chatLabel),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.gps_fixed,
                          color: ColorConstants.logoBg,
                          size: 40.toFont,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            CustomPadding(
              top: 30.0,
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextStrings().patientDetails,
                    style: CustomTextStyle.appBarTitleStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 30.toHeight, horizontal: 30.toWidth),
              width: SizeConfig().screenWidth,
              height: 90.toHeight,
              decoration: BoxDecoration(
                  color: ColorConstants.secondaryDarkAppColor,
                  border: Border.all(color: ColorConstants.grey, width: 0.3),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPadding(
                    left: 15,
                    child: IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: ColorConstants.grey,
                          size: 40.toFont,
                        ),
                        onPressed: () {}),
                  ),
                  Container(
                    width: 500.toWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: TextStrings().yourName,
                          hintStyle: CustomTextStyle.chatLabel),
                    ),
                  ),
                ],
              ),
            ),
            CustomPadding(
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextStrings().checkupFor,
                    style: CustomTextStyle.appBarTitleStyle,
                  ),
                ],
              ),
            ),
            CustomPadding(
              top: 10.0,
              left: 35.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '23+ Tests available ',
                    style: CustomTextStyle.questionTitle,
                  ),
                ],
              ),
            ),
            SpaceBox(20),
            checkupListTile(
                value: '1', checkupType: TextStrings().fullBodyCheckup),
            checkupListTile(value: '2', checkupType: TextStrings().thyroidCare),
            checkupListTile(
                value: '3', checkupType: TextStrings().diabetesScreening),
            checkupListTile(
                value: '4', checkupType: TextStrings().liverFunction),
            checkupListTile(
                value: '5', checkupType: TextStrings().vitaminProfile),
            checkupListTile(value: '6', checkupType: TextStrings().bloodCount),
          ],
        ),
      ),
    );
  }

  Widget checkupListTile({String value, String checkupType}) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 5.toHeight, horizontal: 5.toWidth),
      margin:
          EdgeInsets.symmetric(vertical: 15.toHeight, horizontal: 30.toWidth),
      width: SizeConfig().screenWidth,
      decoration: BoxDecoration(
          color: ColorConstants.secondaryDarkAppColor,
          borderRadius: BorderRadius.circular(6),
          border: isSelected
              ? Border.all(color: ColorConstants.logoBg, width: 1)
              : Border.all(color: ColorConstants.grey, width: 0.3)),
      child: SizedBox(
        width: 240.toWidth,
        height: 80.toHeight,
        child: RadioListTile(
          dense: true,
          activeColor: ColorConstants.logoBg,
          groupValue: selectCheckup,
          title: Text(
            checkupType,
            style: isSelected
                ? TextStyle(
                    fontSize: 30.toFont,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.logoBg)
                : TextStyle(
                    fontSize: 30.toFont,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.headingText),
          ),
          value: value,
          onChanged: (val) {
            setState(() {
              selectCheckup = val;
              isSelected = true;
            });
          },
        ),
      ),
    );
  }
}
