import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class BookDiagnosticCenterCard extends StatefulWidget {
  final String diagnosticImage;
  final String diagnosticName;
  final String diagnosticDesignation;
  final String diagnosticTiming;
  final String diagnosticContact;
  final String diagnosticRating;
  final String diagnosticCharge;
  BookDiagnosticCenterCard(
      {this.diagnosticImage,
      this.diagnosticName,
      this.diagnosticDesignation,
      this.diagnosticTiming,
      this.diagnosticContact,
      this.diagnosticRating,
      this.diagnosticCharge});
  @override
  _BookDiagnosticCenterCardState createState() =>
      _BookDiagnosticCenterCardState();
}

class _BookDiagnosticCenterCardState extends State<BookDiagnosticCenterCard> {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        top: 10.toHeight,
      ),
      width: SizeConfig().screenWidth,
      height: 250.toHeight,
      decoration: BoxDecoration(
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
          ]),
      child: Row(
        children: <Widget>[
          Container(
            width: 230.toWidth,
            height: 180.toHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.diagnosticImage),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: SizeConfig().screenWidth / 1.8,
            height: 250.toHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 50,
                      child: Container(
                        width: 365.toWidth,
                        child: Text(
                          widget.diagnosticName,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyle.diagnosticTitleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPadding(
                      top: 12,
                      child: Text(
                        widget.diagnosticDesignation,
                        style: CustomTextStyle.subTitleStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPadding(
                      top: 20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 30.toFont,
                            color: ColorConstants.starColor,
                          ),
                          Icon(
                            Icons.star_rounded,
                            size: 30.toFont,
                            color: ColorConstants.starColor,
                          ),
                          Icon(
                            Icons.star_rounded,
                            size: 30.toFont,
                            color: ColorConstants.starColor,
                          ),
                          Icon(
                            Icons.star_rounded,
                            size: 30.toFont,
                            color: ColorConstants.starColor,
                          ),
                          Icon(
                            Icons.star_rounded,
                            size: 30.toFont,
                            color: ColorConstants.grey,
                          ),
                          CustomPadding(
                            left: 20.toWidth,
                            child: Text(
                              widget.diagnosticRating,
                              style: CustomTextStyle.ratingStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomPadding(
                      top: 20,
                      child: Text(
                        '284 Reviews',
                        style: CustomTextStyle.questionTitle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
