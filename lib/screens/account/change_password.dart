import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
        title: TextStrings().changePassword,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            passwordtextField(hintText: TextStrings().newPassword),
            passwordtextField(hintText: TextStrings().confirmPassword),
          ],
        ),
      ),
    );
  }

  Widget passwordtextField({String hintText}) {
    return Container(
      margin: EdgeInsets.only(
          left: 30.toWidth, right: 30.toWidth, bottom: 20.toHeight, top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20.toWidth),
      width: SizeConfig().screenWidth,
      height: 100.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: themeData.colorScheme.background,
          border:
              Border.all(color: ColorConstants.unselectedBoxShadow, width: 1)),
      child: Row(
        children: [
          Image.asset(AllImages().lockLogo),
          Container(
            margin: EdgeInsets.only(left: 30.toWidth, top: 10.toWidth),
            width: 400.toWidth,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: CustomTextStyle.chatLabel),
            ),
          ),
        ],
      ),
    );
  }
}
