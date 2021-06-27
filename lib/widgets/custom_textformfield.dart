import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String Function(String) validator;
  bool obsecureText;
  final bool showSuffixIcon;
  CustomTextFormField(
      {this.prefixIcon,
      this.hintText,
      this.keyboardType,
      this.controller,
      this.validator,
      this.showSuffixIcon,
      this.obsecureText});
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obsecureText ?? false,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          suffixIcon: widget.showSuffixIcon ?? false
              ? IconButton(
                  icon: Icon(
                    widget.obsecureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorConstants.greyIconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.obsecureText = !widget.obsecureText;
                    });
                  })
              : SizedBox(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: themeData.colorScheme.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.unselectedBoxShadow,
              width: 2.0,
            ),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: ColorConstants.greyIconColor,
          ),
          hintText: widget.hintText,
          hintStyle: CustomTextStyle.loginTextfieldStyle),
    );
  }
}
