import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/notifications/bottom_sheet_reminder_settings.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MedicationReminders extends StatefulWidget {
  @override
  _MedicationRemindersState createState() => _MedicationRemindersState();
}

class _MedicationRemindersState extends State<MedicationReminders>
    with SingleTickerProviderStateMixin {
  List<int> selectedIndexes = [];
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String buttonText = "Copy URL";
  List<Medicines> medicines = [];

  @override
  void initState() {
    super.initState();
    MixedConstants.prescriptionData.forEach((med) {
      med.medicines.forEach((item) {
        medicines.add(item);
      });
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: "Medication Reminders",
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.toHeight),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.toHeight),
            for (int i = 0; i < medicines.length; i++)
              ListItem(
                index: i,
                medicines: medicines[i],
              ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final int index;
  final Medicines medicines;
  ListItem({
    Key key,
    this.index,
    this.medicines,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
        ],
      ),
      margin:
          EdgeInsets.symmetric(vertical: 20.toWidth, horizontal: 30.toWidth),
      padding:
          EdgeInsets.symmetric(vertical: 20.toWidth, horizontal: 30.toWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.medicines.name,
                style: TextStyle(
                  fontSize: 35.toFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Time: ",
                    style: TextStyle(
                      fontSize: 24.toFont,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    widget.medicines.time,
                    style: TextStyle(
                      fontSize: 24.toFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Interval: ",
                    style: TextStyle(
                      fontSize: 24.toFont,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    widget.medicines.interval,
                    style: TextStyle(
                      fontSize: 24.toFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).showBottomSheet(
                (context) => BottomSheetReminder(
                  medicines: widget.medicines,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorConstants.logoBg,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "SHOW",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
