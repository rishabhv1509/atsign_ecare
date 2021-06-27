import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final String specialistImage;
  final String specialistName;
  final String specialistDesignation;
  final String specialistDescription;
  final String specialistRating;
  final String specialistCharge;
  DoctorCard(
      {this.specialistImage,
      this.specialistName,
      this.specialistDesignation,
      this.specialistDescription,
      this.specialistRating,
      this.specialistCharge});
  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.DOCTORPROFILE);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10.toHeight,
        ),
        width: SizeConfig().screenWidth,
        height: 250.toHeight,
        color: ColorConstants.secondaryDarkAppColor,
        child: Row(
          children: <Widget>[
            Container(
              width: 300.toWidth,
              height: 250.toHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(widget.specialistImage),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: SizeConfig().screenWidth - 210,
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
                          widget.specialistName,
                          style: CustomTextStyle.appBarTitleStyle,
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
                          widget.specialistDesignation,
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
                          widget.specialistDescription,
                          style: CustomTextStyle.grey26,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.toHeight),
                        width: 90.toWidth,
                        height: 47.toHeight,
                        decoration: BoxDecoration(
                          color: ColorConstants.logoBg,
                          borderRadius: BorderRadius.circular(23.5),
                        ),
                        child: Center(
                          child: Text(
                            widget.specialistCharge,
                            style: CustomTextStyle.whiteBold26,
                          ),
                        ),
                      ),
                      CustomPadding(
                        top: 10,
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 35.toFont,
                              color: ColorConstants.starColor,
                            ),
                            Icon(
                              Icons.star_rounded,
                              size: 35.toFont,
                              color: ColorConstants.starColor,
                            ),
                            Icon(
                              Icons.star_rounded,
                              size: 35.toFont,
                              color: ColorConstants.starColor,
                            ),
                            Icon(
                              Icons.star_rounded,
                              size: 35.toFont,
                              color: ColorConstants.grey,
                            ),
                            CustomPadding(
                              left: 20.toWidth,
                              child: Text(
                                widget.specialistRating,
                                style: CustomTextStyle.ratingStyle,
                              ),
                            ),
                          ],
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
