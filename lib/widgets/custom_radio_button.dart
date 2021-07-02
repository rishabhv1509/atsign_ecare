import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/data/category.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRadioButton extends StatefulWidget {
  Category category;

  CustomRadioButton(this.category);
  @override
  CustomRadioButtonState createState() => CustomRadioButtonState();
}

class CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          margin: new EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: ColorConstants.secondaryDarkAppColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 7,
                    color: widget.category.isSelected
                        ? ColorConstants.boxShadow
                        : ColorConstants.unselectedBoxShadow)
              ]),
          child: Card(
              color: Colors.white,
              child: Container(
                height: 300.toHeight,
                width: 300.toWidth,
                alignment: Alignment.center,
                margin: new EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      widget.category.assetImage,
                      width: 100.toWidth,
                      height: 132.toHeight,
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.category.name,
                      style: TextStyle(
                        color: ColorConstants.headingText,
                        fontWeight: widget.category.isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                        fontSize: 30.toFont,
                      ),
                    )
                  ],
                ),
              )),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: widget.category.isSelected,
          child: Icon(
            Icons.check_circle,
            size: 50.toFont,
            color: ColorConstants.logoBg,
          ),
        )
      ],
    );
  }
}
