import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/services/notification_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class BottomSheetReminder extends StatefulWidget {
  final Medicines medicines;
  BottomSheetReminder({Key key, @required this.medicines}) : super(key: key);

  @override
  _BottomSheetReminderState createState() => _BottomSheetReminderState();
}

class _BottomSheetReminderState extends State<BottomSheetReminder> {
  String buttonText = "Copy Url";
  List<String> selectedTime = [];
  bool isActive = false;
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    selectedTime = [...widget.medicines.time.split(",").map((e) => e.trim())];
    notificationService.showNotification("Viral");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      padding: EdgeInsets.all(20),
      height: 450.toHeight,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.logoBg,
                    borderRadius: BorderRadius.circular(5)),
                height: 10.toHeight,
                width: 150.toWidth,
              )
            ],
          ),
          SizedBox(height: 35.toHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.medicines.name,
                style: TextStyle(
                  fontSize: 40.toFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.toHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 40.toFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlutterSwitch(
                height: 50.0.toHeight,
                width: 100.0.toWidth,
                padding: 4.0,
                toggleSize: 22.0,
                borderRadius: 15.0,
                activeColor: themeData.colorScheme.primary,
                value: isActive,
                onToggle: (value) {
                  setState(() {
                    isActive = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 30.toHeight),
          Text(
            "Time",
            style: TextStyle(
              fontSize: 35.toFont,
              fontWeight: FontWeight.bold,
            ),
          ),
          customChip(
              chipText: [
                'Morning',
                "Afternoon",
                "Evening",
                "Night",
              ],
              selected: selectedTime,
              onTap: (String itemName) {
                if (selectedTime.contains(itemName)) {
                  selectedTime.remove(itemName);
                } else
                  selectedTime.add(itemName);
                setState(() {});
              }),
        ],
      ),
    );
  }

  Widget customChip({
    List<String> chipText,
    List<String> selected,
    Function onTap,
  }) {
    return Container(
      width: SizeConfig().screenWidth,
      height: 80.toHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chipText.length,
        itemBuilder: (BuildContext context, int index) {
          bool select = selected.contains(chipText[index]);
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.toWidth, vertical: 10.toHeight),
              child: GestureDetector(
                onTap: () {
                  onTap(chipText[index]);
                },
                child: Chip(
                  label: Text(chipText[index]),
                  labelStyle: !select
                      ? CustomTextStyle.subTitleStyle
                      : CustomTextStyle.customButtonTextStyle,
                  backgroundColor: !select
                      ? Color(0xffF7F9FD)
                      : themeData.colorScheme.primary,
                ),
              ));
        },
      ),
    );
  }
}
