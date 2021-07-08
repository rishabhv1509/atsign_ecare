import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final Doctor doctor;
  DoctorCard({this.doctor});
  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.DOCTORPROFILE,
            arguments: {"doctor": widget.doctor});
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
            Expanded(
              flex: 2,
              child: Container(
                height: 250.toHeight,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.doctor.profileImagePath),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 250.toHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomPadding(
                      top: 20,
                      left: 5,
                      right: 5,
                      child: Text(
                        widget.doctor.name,
                        style: CustomTextStyle.appBarTitleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CustomPadding(
                      top: 8,
                      left: 5,
                      right: 5,
                      child: Text(
                        widget.doctor.speciality,
                        style: CustomTextStyle.subTitleStyle,
                      ),
                    ),
                    Flexible(
                      child: CustomPadding(
                        top: 8,
                        left: 5,
                        right: 5,
                        child: Text(
                          widget.doctor.profileDetails,
                          style: CustomTextStyle.grey26,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.toHeight),
                          padding: EdgeInsets.symmetric(horizontal: 10.toWidth),
                          height: 47.toHeight,
                          decoration: BoxDecoration(
                            color: ColorConstants.logoBg,
                            borderRadius: BorderRadius.circular(23.5),
                          ),
                          child: Center(
                            child: Text(
                              "\$${widget.doctor.pricePerHour.toInt()} / hour",
                              style: CustomTextStyle.whiteBold26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
