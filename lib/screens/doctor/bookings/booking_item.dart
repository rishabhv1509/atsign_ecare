import 'package:at_chat_flutter/utils/init_chat_service.dart';
import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/bookings.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:flutter/material.dart';

class BookingItem extends StatefulWidget {
  final bool bookedLabel;
  final bool showContantIcons;
  final Bookings bookings;

  const BookingItem({
    Key key,
    this.bookedLabel = false,
    this.showContantIcons = true,
    this.bookings,
  }) : super(key: key);

  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          top: 40.toHeight, left: 30.toWidth, right: 30.toWidth),
      width: SizeConfig().screenWidth,
      height: 300.toHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
        ],
        color: ColorConstants.secondaryDarkAppColor,
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250.toWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomPadding(
                      top: 5,
                      left: 10,
                      child: CircleAvatar(
                        radius: 75.toWidth,
                        backgroundColor: ColorConstants.logoBg,
                        child: CircleAvatar(
                          radius: 70.toWidth,
                          backgroundImage: NetworkImage(
                              widget.bookings.patient.profileImage),
                        ),
                      ),
                    ),
                    if (widget.showContantIcons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomPadding(
                            top: 25,
                            left: 50,
                            child: Row(
                              children: [
                                customContact(Icons.messenger, () {
                                  BackendService _backendService =
                                      BackendService.getInstance();
                                  initializeChatService(
                                      _backendService.atClientInstance,
                                      _backendService.currentAtSign);
                                  Navigator.pushNamed(context, Routes.CHAT,
                                      arguments: {
                                        'chatWith': '@adorabledinosaur'
                                      });
                                }),
                                customContact(Icons.phone, () {
                                  Navigator.pushNamed(
                                      context, Routes.VIDEOCALL);
                                }),
                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20.toWidth),
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
                            child: Text(
                              widget.bookings.patient.name,
                              style: CustomTextStyle.appBarTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomPadding(
                            top: 20,
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: ColorConstants.grey,
                              size: 40.toFont,
                            ),
                          ),
                          CustomPadding(
                            top: 20,
                            left: 20,
                            child: Text(
                              "${widget.bookings.date.day < 9 ? "0" + widget.bookings.date.day.toString() : widget.bookings.date.day} ${getMonth(widget.bookings.date.month)} ${widget.bookings.date.year}",
                              style: CustomTextStyle.paymentProfileCard,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomPadding(
                            top: 20,
                            child: Icon(
                              Icons.timer,
                              color: ColorConstants.grey,
                              size: 40.toFont,
                            ),
                          ),
                          CustomPadding(
                            top: 20,
                            left: 20,
                            child: Text(
                              widget.bookings.timeSlot,
                              style: CustomTextStyle.paymentProfileCard,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          if (widget.bookedLabel)
            Positioned(
              bottom: 20.toHeight,
              right: 20.toWidth,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorConstants.logoBg,
                ),
                child: Text(
                  "Booked",
                  style: CustomTextStyle.paymentProfileCard
                      .copyWith(color: Colors.white),
                ),
              ),
            )
        ],
      ),
    );
  }

  String getMonth(i) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[i + 1];
  }

  Widget customContact(IconData icon, Function onTap) {
    return Container(
      margin: EdgeInsets.only(right: 40.toWidth),
      width: 60.toWidth,
      height: 60.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstants.secondaryDarkAppColor,
          boxShadow: [
            BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
          ]),
      child: Center(
          child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        color: ColorConstants.logoBg,
      )),
    );
  }
}
