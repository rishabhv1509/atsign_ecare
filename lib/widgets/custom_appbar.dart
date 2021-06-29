import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function leadingButtonAction;
  final IconData leadingIcon;
  final bool showCenterTitle;
  final Color backgroundColor;
  final bool showTitle;
  final bool showTrailingicon;
  final double elevation;
  final bool showLeadingicon;
  final Function trailingButtonAction;
  CustomAppBar({
    this.elevation,
    this.title = '',
    this.backgroundColor,
    this.leadingIcon,
    this.leadingButtonAction,
    this.showTitle = false,
    this.showTrailingicon = true,
    this.showCenterTitle = false,
    this.showLeadingicon = false,
    this.trailingButtonAction,
  });
  @override
  Size get preferredSize => Size.fromHeight(100.toHeight);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: showCenterTitle,
      elevation: elevation ?? 0,
      backgroundColor: backgroundColor ?? ColorConstants.secondaryDarkAppColor,
      leading: (showLeadingicon)
          ? IconButton(
              icon: Icon(
                leadingIcon,
                color: ColorConstants.black,
              ),
              onPressed: leadingButtonAction,
            )
          : null,
      title: (showTitle)
          ? Container(
              width: SizeConfig().screenWidth / 1.3,
              child: Text(
                title,
                style: CustomTextStyle.titleTextStyle,
              ),
            )
          : null,
      actions: (showTrailingicon)
          ? [
              InkWell(
                onTap: trailingButtonAction,
                child: Padding(
                    padding: EdgeInsets.only(right: 15.toWidth),
                    child: CircleAvatar(
                      backgroundColor: ColorConstants.logoBg,
                      radius: 25.toWidth,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 14.toWidth,
                        backgroundImage: AssetImage(AllImages().heart),
                      ),
                    )),
              ),
            ]
          : null,
    );
  }
}
