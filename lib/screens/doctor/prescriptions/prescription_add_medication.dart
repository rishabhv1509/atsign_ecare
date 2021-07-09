import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/services/notification_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class PrescriptionAddMedication extends StatefulWidget {
  final Function addMedicines;
  PrescriptionAddMedication({Key key, @required this.addMedicines})
      : super(key: key);

  @override
  _PrescriptionAddMedicationState createState() =>
      _PrescriptionAddMedicationState();
}

class _PrescriptionAddMedicationState extends State<PrescriptionAddMedication> {
  String buttonText = "Copy Url";
  List<String> selectedTime = [];
  String selectedInterval = "";
  bool isActive = false;
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.showNotification("Viral");
  }

  TextEditingController _medicineName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        padding: EdgeInsets.all(20),
        height: 750.toHeight,
        width: SizeConfig().screenWidth,
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
            Text(
              "Medicine Name",
              style: TextStyle(
                fontSize: 35.toFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.toHeight),
            CustomTextFormField(
              controller: _medicineName,
              keyboardType: TextInputType.name,
              hintText: "Write Here",
              prefixIcon: Icons.account_circle_outlined,
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
            SizedBox(height: 30.toHeight),
            Text(
              "Interval",
              style: TextStyle(
                fontSize: 35.toFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            customChipTwo(
                chipText: [
                  'Everyday',
                  "Every other day",
                  "Once a week",
                ],
                selected: selectedInterval,
                onTap: (String itemName) {
                  setState(() {
                    selectedInterval = itemName;
                  });
                }),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: "Update Prescription",
                  onTap: () {
                    String time = "";
                    selectedTime.forEach((element) {
                      time = time + element + ",";
                    });
                    widget.addMedicines(Medicines(
                      interval: selectedInterval,
                      name: _medicineName.text,
                      time: time,
                    ));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 30.toHeight),
          ],
        ),
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

  Widget customChipTwo({
    List<String> chipText,
    String selected,
    Function onTap,
  }) {
    return Container(
      width: SizeConfig().screenWidth,
      height: 80.toHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chipText.length,
        itemBuilder: (BuildContext context, int index) {
          bool select = selected == chipText[index];
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
