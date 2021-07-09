import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class PrescriptionAddTests extends StatefulWidget {
  final Function addTests;
  PrescriptionAddTests({Key key, @required this.addTests}) : super(key: key);

  @override
  _PrescriptionAddTestsState createState() => _PrescriptionAddTestsState();
}

class _PrescriptionAddTestsState extends State<PrescriptionAddTests> {
  String buttonText = "Copy Url";

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _testsName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        padding: EdgeInsets.all(20),
        height: 450.toHeight,
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
              "Tests Name",
              style: TextStyle(
                fontSize: 35.toFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.toHeight),
            CustomTextFormField(
              controller: _testsName,
              keyboardType: TextInputType.name,
              hintText: "Write Here",
              prefixIcon: Icons.account_circle_outlined,
            ),
            SizedBox(height: 30.toHeight),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: "Update Prescription",
                  onTap: () {
                    widget.addTests(_testsName.text);
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
}
