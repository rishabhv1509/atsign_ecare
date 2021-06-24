///This is a custom app bar [showTitle] enables to display the title in the center
///[showBackButton] toggles the automatically implies leading functionality
///if [false] it shows a [Close] String instead of backbutton
///[showLeadingButton] toggles the drawer menu button
///[title] is a [String] to display the title of the appbar
///[showTrailingButton] toggles the visibility of trailing button, default add icon
///therefore it has it's navigation embedded in the widget itself.

import 'package:atsign_ecare/services/size_config.dart';
import 'package:atsign_ecare/utils/colors.dart';
import 'package:atsign_ecare/utils/images.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showTitle;
  final bool showBackButton;
  final bool showLeadingicon;
  final bool showTrailingButton;
  final IconData trailingIcon;

  final onActionpressed;

  final double elevation;

  const CustomAppBar({
    this.title,
    this.showTitle = false,
    this.showBackButton = false,
    this.showLeadingicon = false,
    this.showTrailingButton = false,
    this.trailingIcon = Icons.add,
    this.elevation = 0,
    this.onActionpressed,
  });
  @override
  Size get preferredSize => Size.fromHeight(70.toHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 0,
      centerTitle: true,
      leading: (showLeadingicon)
          ? Image.asset(ImageConstants.logoIcon)
          : (showBackButton)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorConstants.fontPrimary,
                    size: 25.toFont,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
              : null,
      title: Row(
        children: [
          Container(
            height: 40.toHeight,
            margin: EdgeInsets.only(top: 5.toHeight),
            child: (!showBackButton && !showLeadingicon)
                ? Center(
                    child: GestureDetector(
                      child: Text(
                        TextStrings().buttonClose,
                        // style: CustomTextStyles.blueRegular18,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: (showTitle)
                ? Center(
                    child: Text(
                      title,
                      // style: CustomTextStyles.primaryBold18,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      actions: [
        Container(
          height: 22.toHeight,
          width: 22.toWidth,
          margin: EdgeInsets.only(right: 30),
          child: (showTitle)
              ? (showTrailingButton)
                  ? IconButton(
                      icon: Icon(
                        trailingIcon,
                        size: 25.toFont,
                      ),
                      onPressed: () async {})
                  : Container()
              : GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Container(
                    height: 22.toHeight,
                    width: 22.toWidth,
                    child: Image.asset(
                      ImageConstants.drawerIcon,
                    ),
                  ),
                ),
        )
      ],
      automaticallyImplyLeading: false,
      backgroundColor: ColorConstants.appBarColor,
    );
  }
}
