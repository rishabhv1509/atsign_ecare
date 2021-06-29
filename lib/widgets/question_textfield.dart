import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class QuestionTextFormField extends StatefulWidget {
  final String value;
  final String optionText;
  final String description;
  final bool showSubTitle;
  QuestionTextFormField(
      {this.value, this.optionText, this.description, this.showSubTitle});

  @override
  _QuestionTextFormFieldState createState() => _QuestionTextFormFieldState();
}

class _QuestionTextFormFieldState extends State<QuestionTextFormField> {
  String selectCheckup = '';
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
        height: (widget.showSubTitle) ? 100.toHeight : 80.toHeight,
        child: RadioListTile(
          dense: true,
          activeColor: ColorConstants.logoBg,
          groupValue: selectCheckup,
          title: Text(
            widget.optionText ?? 'consult',
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
          subtitle: (widget.showSubTitle)
              ? Container(
                  width: 400.toWidth,
                  child: Text(
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.subTitleStyle,
                  ),
                )
              : null,
          value: widget.value,
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
