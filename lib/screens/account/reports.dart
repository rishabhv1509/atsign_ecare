import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.appbarColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: TextStrings().reports,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
          child: CustomPadding(
              top: 30,
              child: Column(children: [
                reportListTile(),
                reportListTile(),
              ]))),
    );
  }

  Widget reportListTile(
      {String leadingIcon,
      String specialitiesTitle,
      Function trailingAction,
      Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 30.toWidth),
        padding:
            EdgeInsets.symmetric(vertical: 5.toHeight, horizontal: 5.toWidth),
        decoration: BoxDecoration(
            color: themeData.colorScheme.background,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
            ]),
        child: ListTile(
          leading: Image.asset(AllImages().pdfLogo),
          title: Text(
            TextStrings().bodyCheck,
            style: CustomTextStyle.cardTextStyle,
          ),
          subtitle: Text(
            TextStrings().clickView,
            style: CustomTextStyle.subTitleStyle,
          ),
        ),
      ),
    );
  }
}
