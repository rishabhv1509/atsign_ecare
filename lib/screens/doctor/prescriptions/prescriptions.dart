import 'dart:convert';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/prescription.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/shared_preferences_service.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PrescriptionsList extends StatefulWidget {
  @override
  _PrescriptionsListState createState() => _PrescriptionsListState();
}

class _PrescriptionsListState extends State<PrescriptionsList>
    with SingleTickerProviderStateMixin {
  Prescription prescription;
  @override
  void initState() {
    super.initState();
    getPrescription();
  }

  getPrescription() async {
    String data =
        await SharedPreferenceService.getData(SharedPrefConstant.Prescription);
    if (data != "") {
      prescription = Prescription.fromJson(jsonDecode(data));
    } else {
      prescription = Prescription(
        content: "",
        date: DateTime.now(),
        doctor: MixedConstants.doctors[0],
        medicines: [],
        patient: MixedConstants.patients[0],
        tests: [],
      );
    }
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
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: "Prescriptions",
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.PRESCRIPTIONSEDIT,
            arguments: {"prescription": prescription},
          ).then((value) => setState(() {}));
        },
        backgroundColor: ColorConstants.logoBg,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: prescription != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("R",
                            style: TextStyle(
                              fontSize: 80.toFont,
                            )),
                        Text("x",
                            style: TextStyle(
                              fontSize: 30.toFont,
                            )),
                      ],
                    ),
                    SizedBox(height: 10.toHeight),
                    for (int i = 0;
                        i < prescription.content.split("\n").length;
                        i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prescription.content.split("\n")[i],
                            style: TextStyle(
                              fontSize: 30.toFont,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    SizedBox(height: 30.toHeight),
                    Row(
                      children: [
                        Text(
                          "Medicines",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (prescription.medicines.length == 0)
                      SizedBox(height: 30.toHeight),
                    if (prescription.medicines.length == 0)
                      Text(
                        "No Medicines added yet",
                        style: TextStyle(fontSize: 30.toFont),
                      ),
                    if (prescription.medicines.length > 0)
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 20.0),
                        child: Table(
                          columnWidths: {
                            1: FractionColumnWidth(0.4),
                          },
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              Container(
                                color: Color(0xFF1F2A37),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                color: Color(0xFF1F2A37),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Time',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                color: Color(0xFF1F2A37),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Interval',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                            for (int i = 0;
                                i < prescription.medicines.length;
                                i++)
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(prescription.medicines[i].name),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(prescription.medicines[i].time),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text(prescription.medicines[i].interval),
                                ),
                              ]),
                          ],
                        ),
                      ),
                    SizedBox(height: 30.toHeight),
                    Row(
                      children: [
                        Text(
                          "Test",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (prescription.tests.length == 0)
                      SizedBox(height: 30.toHeight),
                    if (prescription.tests.length == 0)
                      Text(
                        "No Tests added yet",
                        style: TextStyle(fontSize: 30.toFont),
                      ),
                    if (prescription.tests.length > 0)
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15.toHeight),
                            for (int i = 0; i < prescription.tests.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  "${i + 1})   ${prescription.tests[i]}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
