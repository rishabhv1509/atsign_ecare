import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String accountTypedes;
  final String accountType;
  final Function onTap;
  final displayColumn;
  CustomFlatButton(
      {this.accountType, this.accountTypedes, this.onTap, this.displayColumn});
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return displayColumn ?? false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                accountTypedes ?? "",
                textAlign: TextAlign.center,
                style: CustomTextStyle.grey26,
              ),
              SpaceBox(30),
              InkWell(
                onTap: onTap,
                child: Text(
                  accountType ?? "",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.primaryBold26,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                accountTypedes ?? "",
                textAlign: TextAlign.center,
                style: CustomTextStyle.grey26,
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  accountType ?? "",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.primaryBold26,
                ),
              ),
            ],
          );
  }
}
