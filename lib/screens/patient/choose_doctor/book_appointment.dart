import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String selectTimeSlot = '';
  Color unavailable = ColorConstants.secondaryDarkAppColor;
  Color selectedSlot = ColorConstants.grey;
  String _selectedDate;
  String _dateCount;
  String _range;
  String _rangeCount;

  @override
  void initState() {
    _selectedDate = '';
    _dateCount = '';
    _range = '';
    _rangeCount = '';
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      body: Column(
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
                      color: ColorConstants.unselectedBoxShadow, blurRadius: 20)
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
                  Row(
                    children: [timeSlot('1'), timeSlot('2')],
                  ),
                  Row(
                    children: [timeSlot('3'), timeSlot('4')],
                  ),
                ],
              )),
          SpaceBox(130.toHeight),
          CustomButton(
            width: 600.toWidth,
            buttonText: TextStrings().confirm,
            onTap: () {
              Navigator.pushNamed(context, Routes.MAKEPAYMENTS);
            },
          ),
        ],
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
          color: (value == '2') ? ColorConstants.grey : unavailable,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: (value == '3') ? ColorConstants.logoBg : ColorConstants.grey,
          )),
      child: SizedBox(
        width: 250.toWidth,
        height: 80.toHeight,
        child: RadioListTile(
          dense: true,
          activeColor: ColorConstants.logoBg,
          groupValue: selectTimeSlot,
          title: Text(
            '10 AM - 11 AM',
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
