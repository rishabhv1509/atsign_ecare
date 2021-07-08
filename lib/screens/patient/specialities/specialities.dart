import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Specialities extends StatefulWidget {
  @override
  _SpecialitiesState createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller =
        TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        title: TextStrings().specialitiesTitle,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.toHeight),
            specialitiesListTile(
              leadingIcon: AllImages().gynecologist,
              specialitiesTitle: TextStrings().gynecologist,
            ),
            specialitiesListTile(
              leadingIcon: AllImages().physician,
              specialitiesTitle: TextStrings().physician,
            ),
            specialitiesListTile(
              leadingIcon: AllImages().orthopedician,
              specialitiesTitle: TextStrings().orthopedician,
            ),
            specialitiesListTile(
              leadingIcon: AllImages().dietician,
              specialitiesTitle: TextStrings().dietician,
            ),
            specialitiesListTile(
              leadingIcon: AllImages().childrensHealth,
              specialitiesTitle: TextStrings().childrensHealth,
            ),
            specialitiesListTile(
              leadingIcon: AllImages().skinHair,
              specialitiesTitle: TextStrings().skinHair,
            ),
            specialitiesListTile(
              leadingIcon: AllImages().mentalWellness,
              specialitiesTitle: TextStrings().mentalWellness,
            ),
          ],
        ),
      ),
    );
  }

  Widget specialitiesListTile(
      {String leadingIcon, String specialitiesTitle, Function onClick}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.DOCTORSLIST,
          arguments: {"speciality": specialitiesTitle},
        );
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 30.toWidth),
        padding:
            EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 10.toWidth),
        decoration: BoxDecoration(
            color: ColorConstants.secondaryDarkAppColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
            ]),
        child: ListTile(
          leading: Image.asset(leadingIcon),
          title: Text(
            specialitiesTitle,
            style: CustomTextStyle.cardTextStyle,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: ColorConstants.headingText,
          ),
        ),
      ),
    );
  }
}
