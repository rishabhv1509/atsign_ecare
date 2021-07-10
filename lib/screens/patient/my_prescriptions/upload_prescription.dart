import 'dart:async';
import 'dart:io';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/data/category.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/custom_radio_button.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPrescription extends StatefulWidget {
  @override
  _UploadPrescriptionState createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  bool showLoginForm = false;
  bool showLoginWithEmail = false;
  List<Category> category = [];
  final ImagePicker _picker = ImagePicker();
  File _file;
  bool isLoading = false;
  // ignore: close_sinks

  String userType;
  @override
  void initState() {
    category.add(
      new Category(
        "Open camera",
        AllImages().camera,
        false,
        "",
      ),
    );
    category.add(
      new Category(
        "Choose from File Storage",
        AllImages().gallery,
        false,
        "",
      ),
    );
    super.initState();
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  rowStart([
                    CustomPadding(
                      top: 20.0,
                      left: 50.0,
                      child: Text(
                        "Upload Documents",
                        style: CustomTextStyle.titleTextStyle,
                      ),
                    )
                  ]),
                  rowStart([
                    CustomPadding(
                      top: 20.0,
                      left: 55.0,
                      child: Text(
                        "Upload medical document for future references.",
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.subTitleStyle,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                  ]),
                  SpaceBox(50),
                  Container(
                      alignment: Alignment.center,
                      width: SizeConfig().screenWidth,
                      child: Column(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () async {},
                              child: CustomRadioButton(category[0]),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                String _filePicked = (await _picker.getImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 30,
                                ))
                                    .path;
                                print(_filePicked);
                                if (_filePicked != null) {
                                  setState(() {
                                    _file = File(_filePicked);
                                  });
                                }
                              },
                              child: CustomRadioButton(category[1]),
                            ),
                          ),
                          SizedBox(height: 20.toHeight),
                          if (_file != null)
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Image.file(_file)),
                          // Text("File : ${_file.path.split("/").last}")
                        ],
                      )),
                  SizedBox(height: 20.toHeight),
                  if (isLoading) SizedBox(height: 10.toHeight),
                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (isLoading) SizedBox(height: 10.toHeight),
                  if (isLoading)
                    Center(
                      child: Text("Please wait..."),
                    ),
                  if (!isLoading)
                    CustomButton(
                        buttonText: "Upload",
                        onTap: () async {
                          if (_file != null) {
                            setState(() {
                              isLoading = true;
                            });
                            Timer(Duration(seconds: 3), () {
                              Navigator.pop(context);
                            });
                          } else {
                            _showError("Please select image");
                          }
                        }),
                ],
              ),
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
}
