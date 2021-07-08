import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class QuestionTextFormField extends StatefulWidget {
  final String value;
  final String optionText;
  final String description;
  final bool showSubTitle;
  final bool isSelected;
  QuestionTextFormField({
    this.value,
    this.optionText,
    this.description,
    this.showSubTitle,
    this.isSelected,
  });

  @override
  _QuestionTextFormFieldState createState() => _QuestionTextFormFieldState();
}

class _QuestionTextFormFieldState extends State<QuestionTextFormField> {
  String selectCheckup = '';

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
          border: widget.isSelected
              ? Border.all(color: ColorConstants.logoBg, width: 1)
              : Border.all(color: ColorConstants.grey, width: 0.3)),
      child: SizedBox(
        width: 240.toWidth,
        height: (widget.showSubTitle) ? 100.toHeight : 80.toHeight,
        child: ListTile(
          dense: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color:
                      widget.isSelected ? ColorConstants.logoBg : Colors.white,
                  border: Border.all(
                    color: ColorConstants.logoBg,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 30.toWidth),
              Text(
                widget.optionText ?? 'consult',
                style: widget.isSelected
                    ? TextStyle(
                        fontSize: 30.toFont,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.logoBg)
                    : TextStyle(
                        fontSize: 30.toFont,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.headingText),
              ),
            ],
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
        ),
      ),
    );
  }
}
