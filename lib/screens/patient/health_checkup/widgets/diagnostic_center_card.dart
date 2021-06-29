import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class DiagnosticCenterCard extends StatefulWidget {
  final String diagnosticImage;
  final String diagnosticName;
  final String diagnosticDesignation;
  final String diagnosticTiming;
  final String diagnosticContact;
  final String diagnosticRating;
  final String diagnosticCharge;
  DiagnosticCenterCard(
      {this.diagnosticImage,
      this.diagnosticName,
      this.diagnosticDesignation,
      this.diagnosticTiming,
      this.diagnosticContact,
      this.diagnosticRating,
      this.diagnosticCharge});
  @override
  _DiagnosticCenterCardState createState() => _DiagnosticCenterCardState();
}

class _DiagnosticCenterCardState extends State<DiagnosticCenterCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.BOOKDIAGNOSTICCENTER);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.toHeight, bottom: 10.toHeight),
        width: SizeConfig().screenWidth,
        height: 250.toHeight,
        color: ColorConstants.secondaryDarkAppColor,
        child: Row(
          children: <Widget>[
            Container(
              width: 250.toWidth,
              height: 230.toHeight,
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
                        top: 20,
                        child: Text(
                          widget.diagnosticName,
                          style: CustomTextStyle.diagnosticTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomPadding(
                        top: 8,
                        child: Text(
                          widget.diagnosticDesignation,
                          style: CustomTextStyle.subTitleStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomPadding(
                        top: 8,
                        child: Text(
                          widget.diagnosticTiming,
                          style: CustomTextStyle.grey26,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomPadding(
                        top: 8,
                        child: Text(
                          widget.diagnosticContact,
                          style: CustomTextStyle.grey26,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPadding(
                        top: 10,
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
                        top: 10,
                        left: 20.toWidth,
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
      ),
    );
  }
}
