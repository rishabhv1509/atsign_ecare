import 'dart:io';

import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/data/category.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/custom_radio_button.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AiAnalysisScreen extends StatefulWidget {
  @override
  _AiAnalysisScreenState createState() => _AiAnalysisScreenState();
}

class _AiAnalysisScreenState extends State<AiAnalysisScreen> {
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
        "Choose from Gallery",
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
                        "Upload X-Ray scan",
                        style: CustomTextStyle.titleTextStyle,
                      ),
                    )
                  ]),
                  rowStart([
                    CustomPadding(
                      top: 20.0,
                      left: 55.0,
                      child: Text(
                        "Our AI model analyse the X-ray image of Lungs.",
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.subTitleStyle,
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
                        buttonText: TextStrings().buttonContinue,
                        onTap: () async {
                          if (_file != null) {
                            final data = await uploadImage();
                            Navigator.pushNamed(
                                context, Routes.AIANALYSISSCREENRESULT,
                                arguments: {"data": data});
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

  Future<dynamic> uploadImage() async {
    String fileName = _file.path.split('/').last;
    setState(() {
      isLoading = true;
    });
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(_file.path, filename: fileName),
    });
    Response response =
        await Dio(BaseOptions(baseUrl: "https://atsign-ecare.herokuapp.com"))
            .post("/api/", data: formData);
    print(response.data['data']);
    setState(() {
      isLoading = false;
    });
    return response.data['data'];
  }
}
