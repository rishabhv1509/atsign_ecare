import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms>
    with SingleTickerProviderStateMixin {
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
        title: TextStrings().symptoms,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          top: 30,
          child: Column(
            children: [
              symptomsListTile(
                leadingIcon: AllImages().fever,
                specialitiesTitle: TextStrings().fever,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().anxiety,
                specialitiesTitle: TextStrings().anxiety,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().headache,
                specialitiesTitle: TextStrings().headache,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().cough,
                specialitiesTitle: TextStrings().cough,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().acidity,
                specialitiesTitle: TextStrings().acidity,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().depression,
                specialitiesTitle: TextStrings().depression,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().diabetes,
                specialitiesTitle: TextStrings().diabetes,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().stomach,
                specialitiesTitle: TextStrings().stomach,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().pregnancy,
                specialitiesTitle: TextStrings().pregnancy,
                trailingAction: () {},
              ),
              symptomsListTile(
                leadingIcon: AllImages().weightLoss,
                specialitiesTitle: TextStrings().weightLoss,
                trailingAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget symptomsListTile(
      {String leadingIcon, String specialitiesTitle, Function trailingAction}) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 30.toWidth),
      padding:
          EdgeInsets.symmetric(vertical: 5.toHeight, horizontal: 5.toWidth),
      decoration: BoxDecoration(
          color: ColorConstants.secondaryDarkAppColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
          ]),
      child: ListTile(
        leading: Image.asset(leadingIcon),
        title: Text(
          specialitiesTitle,
          style: CustomTextStyle.cardTextStyle,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: ColorConstants.headingText,
          ),
          onPressed: trailingAction,
        ),
      ),
    );
  }
}
