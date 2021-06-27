import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class LocationSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomPadding(
      top: 30,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 30.toWidth),
        width: SizeConfig().screenWidth,
        height: 100.toHeight,
        decoration: BoxDecoration(
            color: themeData.colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
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
                  color: themeData.colorScheme.primary,
                  size: 40.toFont,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
