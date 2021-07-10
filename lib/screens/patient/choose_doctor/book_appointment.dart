import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/consultation.dart';
import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookAppointment extends StatefulWidget {
  final Doctor doctor;

  const BookAppointment({Key key, @required this.doctor}) : super(key: key);

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String selectTimeSlot = '';
  DateTime _selectedDate;
  Color unavailable = ColorConstants.secondaryDarkAppColor;
  Color selectedSlot = ColorConstants.grey;

  @override
  void initState() {
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = args.value;
      }
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void _showError(String error) async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error),
      ));
    }

    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: TextStrings().chooseDateandTime,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomPadding(
              top: 50.0,
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextStrings().selectDate,
                    style: CustomTextStyle.appBarTitleStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 30.toHeight,
                  left: 40.toWidth,
                  right: 30.toWidth,
                  bottom: 50.toHeight),
              width: SizeConfig().screenWidth,
              height: 450.toHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorConstants.secondaryDarkAppColor,
                  boxShadow: [
                    BoxShadow(
                        color: ColorConstants.unselectedBoxShadow,
                        blurRadius: 20)
                  ]),
              child: SfDateRangePicker(
                todayHighlightColor: ColorConstants.logoBg,
                selectionColor: ColorConstants.logoBg,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            CustomPadding(
              top: 30.0,
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextStrings().selectTime,
                    style: CustomTextStyle.appBarTitleStyle,
                  ),
                ],
              ),
            ),
            CustomPadding(
              top: 10.0,
              left: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextStrings().slotAvailable,
                    style: CustomTextStyle.questionTitle,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.toHeight),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    for (int i = 0;
                        i < widget.doctor.timeSlots.length;
                        i = i + 2)
                      Row(
                        children: [
                          timeSlot(widget.doctor.timeSlots[i]),
                          if (i + 1 < widget.doctor.timeSlots.length)
                            timeSlot(widget.doctor.timeSlots[i + 1])
                        ],
                      ),
                    // Row(
                    //   children: [timeSlot('3'), timeSlot('4')],
                    // ),
                  ],
                )),
            SpaceBox(50.toHeight),
            CustomButton(
              width: 600.toWidth,
              buttonText: TextStrings().confirm,
              onTap: () {
                if (_selectedDate == null) {
                  _showError("Please select date");
                } else if (selectTimeSlot == "") {
                  _showError("Please select timeslots");
                } else {
                  Navigator.pushNamed(context, Routes.MAKEPAYMENTS, arguments: {
                    "consultation": Consultation(
                      doctor: widget.doctor,
                      date: _selectedDate,
                      timeSlot: selectTimeSlot,
                    )
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget timeSlot(String value) {
    return Container(
      width: 300.toWidth,
      margin: EdgeInsets.only(
        bottom: 10.toHeight,
        top: 20.toHeight,
        right: 5.toWidth,
        left: 10.toWidth,
      ),
      decoration: BoxDecoration(
          color: unavailable,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: ColorConstants.grey,
          )),
      child: SizedBox(
        width: 250.toWidth,
        height: 80.toHeight,
        child: RadioListTile(
          dense: true,
          activeColor: ColorConstants.logoBg,
          groupValue: selectTimeSlot,
          title: Text(
            value,
            style: CustomTextStyle.slotTextStyle,
          ),
          value: value,
          onChanged: (val) {
            setState(() {
              selectTimeSlot = val;
            });
          },
        ),
      ),
    );
  }
}
