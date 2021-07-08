import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/prescription.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/my_prescriptions/bottom_share_url.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyPrescriptionsDetails extends StatefulWidget {
  final Prescription prescription;

  const MyPrescriptionsDetails({Key key, @required this.prescription})
      : super(key: key);
  @override
  _MyPrescriptionsDetailsState createState() => _MyPrescriptionsDetailsState();
}

class _MyPrescriptionsDetailsState extends State<MyPrescriptionsDetails>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

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
      floatingActionButton: GestureDetector(
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
      ),
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        showTitle: true,
        title: widget.prescription.doctor.name,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Color(0xFFF69E0B),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.toHeight),
              Text(
                widget.prescription.doctor.hospital,
                style: TextStyle(
                  fontSize: 55.toFont,
                  color: Color(0xFFF69E0B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.toHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.prescription.doctor.name,
                    style: TextStyle(
                      fontSize: 35.toFont,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10.toWidth),
                  Text(
                    widget.prescription.doctor.speciality,
                    style: TextStyle(
                      fontSize: 22.toFont,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.toHeight),
              Text(
                widget.prescription.doctor.address,
                style: TextStyle(
                  fontSize: 21.toFont,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.toHeight),
              Text(
                widget.prescription.doctor.phoneNumber,
                style: TextStyle(
                  fontSize: 21.toFont,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 25.toHeight),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30.toWidth,
                ),
                height: 1,
                color: Color(0xFFF69E0B),
              ),
              SizedBox(height: 25.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            "P. Name: ",
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            widget.prescription.patient.name,
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      flex: 4,
                    ),
                    Expanded(
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            "Age: ",
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            widget.prescription.patient.age,
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      flex: 2,
                    ),
                  ],
                  mainAxisSize: MainAxisSize.max,
                ),
              ),
              SizedBox(height: 10.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            "Date: ",
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            formatDate(widget.prescription.date),
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      flex: 4,
                    ),
                    Expanded(
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            "Gender: ",
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            widget.prescription.patient.gender,
                            style: TextStyle(
                              fontSize: 25.toFont,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      flex: 2,
                    ),
                  ],
                  mainAxisSize: MainAxisSize.max,
                ),
              ),
              SizedBox(height: 30.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "R",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "x",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    for (int i = 0;
                        i < widget.prescription.content.split("\n").length;
                        i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          widget.prescription.content.split("\n")[i],
                          style: TextStyle(
                            fontSize: 28.toFont,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(height: 30.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
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
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
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
                        i < widget.prescription.medicines.length;
                        i++)
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.prescription.medicines[i].name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.prescription.medicines[i].time),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text(widget.prescription.medicines[i].interval),
                        ),
                      ]),
                  ],
                ),
              ),
              SizedBox(height: 30.toHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
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
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.toHeight),
                    for (int i = 0; i < widget.prescription.tests.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        child: Text(
                          "${i + 1})   ${widget.prescription.tests[i]}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 30.toHeight),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30.toWidth,
                ),
                height: 1,
                color: Color(0xFFF69E0B),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.prescription.doctor.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  formatDate(DateTime date) {
    return "${date.year}/${date.month < 9 ? "0" + date.month.toString() : date.month}/${date.day < 9 ? "0" + date.day.toString() : date.day}";
  }

  Future<String> callApi() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> postData = {
      "doctor": {
        "hospital_name": widget.prescription.doctor.hospital,
        "doctor_name": widget.prescription.doctor.name,
        "doctor_degree": widget.prescription.doctor.speciality,
        "doctor_address": widget.prescription.doctor.address,
        "doctor_number": widget.prescription.doctor.phoneNumber,
        "doctor_email": widget.prescription.doctor.email,
      },
      "patient": {
        "patient_name": widget.prescription.patient.name,
        "patient_age": widget.prescription.patient.age,
        "patient_gender": widget.prescription.patient.gender,
      },
      "date": formatDate(widget.prescription.date),
      "content": widget.prescription.content,
      "medicines": widget.prescription.medicines
          .map((med) => {
                "name": med.name,
                "time": med.time,
                "interval": med.interval,
              })
          .toList(),
      "tests": widget.prescription.tests,
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
