import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/account/widgets/past_booking_card.dart';
import 'package:atsign_ecare/screens/account/widgets/recent_booking_card.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appbarColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: TextStrings().bookingHistory,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPadding(
              top: 50,
              left: 40,
              child: Text(
                TextStrings().recentBooking,
                style: CustomTextStyle.cardTextStyle,
              ),
            ),
          ],
        ),
        Container(
          width: SizeConfig().screenWidth,
          height: 360.toHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return RecentBookingcard();
              }),
        ),
        SpaceBox(80),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 30.toHeight, horizontal: 30.toHeight),
          margin: EdgeInsets.symmetric(
              horizontal: 30.toWidth, vertical: 30.toHeight),
          width: SizeConfig().screenWidth,
          height: 100.toHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorConstants.pastBooking),
          child: Text(
            TextStrings().pastBooking,
            style: CustomTextStyle.cardTextStyle,
          ),
        ),
        Container(
          width: SizeConfig().screenWidth,
          height: 360.toHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return PastBookingcard();
              }),
        ),
      ],
    );
  }
}
