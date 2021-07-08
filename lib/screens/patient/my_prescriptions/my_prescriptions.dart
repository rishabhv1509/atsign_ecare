import 'dart:async';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/my_prescriptions/bottom_share_url.dart';
import 'package:atsign_ecare/screens/patient/my_prescriptions/my_prescriptions_details.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyPrescriptions extends StatefulWidget {
  @override
  _MyPrescriptionsState createState() => _MyPrescriptionsState();
}

class _MyPrescriptionsState extends State<MyPrescriptions>
    with SingleTickerProviderStateMixin {
  List<int> selectedIndexes = [];
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String buttonText = "Copy URL";

  @override
  void initState() {
    super.initState();
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
      floatingActionButton: selectedIndexes.length > 0
          ? GestureDetector(
              onTap: () async {
                String url = await callApi();
                scaffoldKey.currentState.showBottomSheet((context) {
                  return BottomSheetUrl(url: url);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstants.logoBg,
                  borderRadius: BorderRadius.circular(400),
                ),
                padding: EdgeInsets.all(15),
                child: isLoading
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : Icon(
                        Icons.share,
                        size: 32,
                        color: Colors.white,
                      ),
              ),
            )
          : Container(),
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: "My Prescriptions",
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.toHeight),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Long press to select and share",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.toHeight),
                  for (int i = 0;
                      i < MixedConstants.prescriptionData.length;
                      i++)
                    specialitiesListTile(
                      index: i,
                      title: MixedConstants.prescriptionData[i].doctor.name,
                      subtitle:
                          formatDate(MixedConstants.prescriptionData[i].date),
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyPrescriptionsDetails(
                              prescription: MixedConstants.prescriptionData[i],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  formatDate(DateTime date) {
    return "${date.year}/${date.month < 9 ? "0" + date.month.toString() : date.month}/${date.day < 9 ? "0" + date.day.toString() : date.day}";
  }

  Widget specialitiesListTile({
    int index,
    String title,
    String subtitle,
    Function onClick,
  }) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          selectedIndexes.add(index);
        });
      },
      onTap: () {
        if (selectedIndexes.length == 0)
          onClick();
        else if (selectedIndexes.contains(index))
          setState(() {
            selectedIndexes.remove(index);
          });
        else if (!selectedIndexes.contains(index))
          setState(() {
            selectedIndexes.add(index);
          });
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 30.toWidth),
        padding:
            EdgeInsets.symmetric(vertical: 10.toHeight, horizontal: 10.toWidth),
        decoration: BoxDecoration(
            color: selectedIndexes.contains(index)
                ? ColorConstants.boxShadow
                : ColorConstants.secondaryDarkAppColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.unselectedBoxShadow, blurRadius: 10)
            ]),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 30.toFont,
              fontWeight: FontWeight.w500,
              color: ColorConstants.headingText,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text("Date: ", style: TextStyle(fontSize: 25.toFont)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 25.toFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: ColorConstants.headingText,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Future<String> callApi() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> postData = {
      "doctor": {
        "hospital_name": MixedConstants.prescriptionData[0].doctor.hospital,
        "doctor_name": MixedConstants.prescriptionData[0].doctor.name,
        "doctor_degree": MixedConstants.prescriptionData[0].doctor.speciality,
        "doctor_address": MixedConstants.prescriptionData[0].doctor.address,
        "doctor_number": MixedConstants.prescriptionData[0].doctor.phoneNumber,
        "doctor_email": MixedConstants.prescriptionData[0].doctor.email,
      },
      "patient": {
        "patient_name": MixedConstants.prescriptionData[0].patient.name,
        "patient_age": MixedConstants.prescriptionData[0].patient.age,
        "patient_gender": MixedConstants.prescriptionData[0].patient.gender,
      },
      "date": formatDate(MixedConstants.prescriptionData[0].date),
      "content": MixedConstants.prescriptionData[0].content,
      "medicines": MixedConstants.prescriptionData[0].medicines
          .map((med) => {
                "name": med.name,
                "time": med.time,
                "interval": med.interval,
              })
          .toList(),
      "tests": MixedConstants.prescriptionData[0].tests,
    };
    Response response =
        await Dio(BaseOptions(baseUrl: "https://atsign-ecare.herokuapp.com"))
            .post("/generate-report", data: postData);
    setState(() {
      isLoading = false;
    });
    return response.data['url'];
  }
}
