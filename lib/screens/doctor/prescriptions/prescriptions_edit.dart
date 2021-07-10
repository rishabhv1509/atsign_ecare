import 'dart:convert';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/validators.dart';
import 'package:atsign_ecare/models/medicine.dart';
import 'package:atsign_ecare/models/prescription.dart';
import 'package:atsign_ecare/screens/doctor/prescriptions/prescription_add_medication.dart';
import 'package:atsign_ecare/screens/doctor/prescriptions/prescription_add_tests.dart';
import 'package:atsign_ecare/services/shared_preferences_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class PrescriptionEdit extends StatefulWidget {
  final Prescription prescription;

  const PrescriptionEdit({Key key, @required this.prescription})
      : super(key: key);
  @override
  _PrescriptionEditState createState() => _PrescriptionEditState();
}

class _PrescriptionEditState extends State<PrescriptionEdit> {
  bool showLoginForm = false;
  bool showLoginWithEmail = false;
  Prescription _prescription;
  // ignore: close_sinks

  final TextEditingController _contentCtrl = TextEditingController();
  String userType;
  @override
  void initState() {
    _prescription = widget.prescription;
    super.initState();
    _contentCtrl.text = _prescription.content;
  }

  bool showOtpScreen = false;

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  Validators validators = Validators();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  addMedicines(Medicines medicines) {
    setState(() {
      _prescription.medicines.add(medicines);
    });
  }

  addTests(String test) {
    setState(() {
      _prescription.tests.add(test);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.toHeight),
                rowStart([
                  CustomPadding(
                    left: 50.0,
                    child: Text(
                      "Edit Prescription",
                      style: CustomTextStyle.titleTextStyle,
                    ),
                  )
                ]),
                SizedBox(height: 40.toHeight),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig().screenWidth,
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: 550.toWidth,
                            color: ColorConstants.secondaryDarkAppColor,
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formkey,
                                autovalidateMode: autovalidate,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFormField(
                                      showPrefixIcon: false,
                                      controller: _contentCtrl,
                                      keyboardType: TextInputType.name,
                                      hintText: "Write here",
                                      validator: validators.validateName,
                                      maxLine: 4,
                                    ),
                                    SpaceBox(50.toHeight),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(height: 40.toHeight),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomPadding(
                              left: 50.0,
                              child: Text(
                                "Medication",
                                style: CustomTextStyle.titleTextStyle,
                              ),
                            ),
                            Spacer(),
                            MedicationAddBtn(addMedicines: addMedicines),
                            SizedBox(width: 50.toWidth),
                          ],
                        ),
                        SizedBox(height: 40.toHeight),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                            top: 20.0,
                            left: 60.toWidth,
                            right: 60.toWidth,
                          ),
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
                              if (_prescription.medicines.length > 0)
                                for (int i = 0;
                                    i < _prescription.medicines.length;
                                    i++)
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(_prescription.medicines[i].name),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(_prescription.medicines[i].time),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          _prescription.medicines[i].interval),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.toHeight),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomPadding(
                              left: 50.0,
                              child: Text(
                                "Tests",
                                style: CustomTextStyle.titleTextStyle,
                              ),
                            ),
                            Spacer(),
                            TestsAddBtn(addTests: addTests),
                            SizedBox(width: 50.toWidth),
                          ],
                        ),
                        SizedBox(height: 40.toHeight),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.toHeight),
                              for (int i = 0;
                                  i < _prescription.tests.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    "${i + 1})   ${_prescription.tests[i]}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.toHeight),
                        CustomButton(
                          buttonText: "Update Prescription",
                          onTap: () async {
                            _prescription.content = _contentCtrl.text;
                            String data = jsonEncode(
                              Prescription(
                                content: _contentCtrl.text,
                                date: _prescription.date,
                                doctor: _prescription.doctor,
                                medicines: _prescription.medicines,
                                patient: _prescription.patient,
                                tests: _prescription.tests,
                              ),
                            );
                            await SharedPreferenceService.setData(
                                SharedPrefConstant.Prescription, data);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.toHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowStart(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: child,
    );
  }

  Widget errorAlert() {
    return SnackBar(
      duration: Duration(seconds: 10),
      elevation: 10.toHeight,
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      content: Text(
        'Phone Number already exists',
        style: TextStyle(color: ColorConstants.logoBg),
      ),
      action: SnackBarAction(
        label: 'Login',
        onPressed: () {
          _formkey.currentState.reset();
        },
      ),
    );
  }
}

class MedicationAddBtn extends StatelessWidget {
  final Function addMedicines;
  const MedicationAddBtn({
    Key key,
    @required this.addMedicines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showBottomSheet(
          (context) => PrescriptionAddMedication(
            addMedicines: addMedicines,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: ColorConstants.logoBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class TestsAddBtn extends StatelessWidget {
  final Function addTests;
  const TestsAddBtn({
    Key key,
    @required this.addTests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showBottomSheet(
          (context) => PrescriptionAddTests(
            addTests: addTests,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: ColorConstants.logoBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
