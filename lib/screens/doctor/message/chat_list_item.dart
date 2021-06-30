import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatefulWidget {
  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30.toHeight,
        horizontal: 35.toWidth,
      ),
      width: SizeConfig().screenWidth,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        color: ColorConstants.secondaryDarkAppColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 45.toWidth,
            backgroundImage: AssetImage(AllImages().videoCallDoctor),
          ),
          SizedBox(width: 40.toWidth),
          Container(
            width: SizeConfig().screenWidth - 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomPadding(
                  child: Text(
                    'Robert Kilm',
                    style: CustomTextStyle.appBarTitleStyle.copyWith(
                      fontSize: 28.toFont,
                    ),
                  ),
                ),
                CustomPadding(
                  child: Text(
                    'Last Message',
                    style: CustomTextStyle.subTitleStyle.copyWith(
                      fontSize: 21.toFont,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customContact(IconData icon, Function onTap) {
    return Container(
      margin: EdgeInsets.only(right: 40.toWidth),
      width: 60.toWidth,
      height: 60.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
          ]),
      child: Center(
          child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        color: ColorConstants.logoBg,
      )),
    );
  }
}
