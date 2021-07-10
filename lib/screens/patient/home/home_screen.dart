import 'dart:async';
import 'dart:convert';


import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/models/patient.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/services/shared_preferences_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/carousel_sliders_item.dart';
import 'package:atsign_ecare/widgets/category_card.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_textformfield.dart';
import 'package:atsign_ecare/widgets/fab.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
// import 'package:speech_recognition/speech_recognition.dart';

class HomeScreen extends StatefulWidget {
  final String userType;
  final String phoneNumber;
  HomeScreen({this.userType, this.phoneNumber});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchCtrl = TextEditingController();
  int _current;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
  ];
  Patient patient;
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  String _currentLocale = 'en_US';

  @override
  void initState() {
    activateSpeechRecognizer();
    super.initState();
  }

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    // _speech
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  getData() async {
    var data =
        await SharedPreferenceService.getData(SharedPrefConstant.PatientData);
    patient = Patient.fromJson(json.decode(data));
    print(patient.name);
  }

  Widget _buildButton({String label, onPressed}) => new Padding(
      padding: new EdgeInsets.all(12.0),
      child: new RaisedButton(
        color: Colors.cyan.shade600,
        onPressed: onPressed,
        child: new Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ));

  void start() => _speech
      .listen(locale: _currentLocale)
      .then((result) => print('_MyAppState.start => result ${result}'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() =>
      _speech.stop().then((result) => setState(() => _isListening = result));

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) =>
      setState(() => _currentLocale = locale);

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() {
        transcription = text;
        print("text => $text");
      });

  void onRecognitionComplete() {
    print("object => $transcription");
    setState(() => _isListening = false);
    openScreenFromVoiceCommand();
    Timer(Duration(seconds: 4), () {
      transcription = '';
      setState(() {});
    });
  }

  openScreenFromVoiceCommand() {
    if (transcription.toLowerCase().contains("prescription")) {
      Navigator.pushNamed(
        context,
        Routes.MYPRESCRIPTIONS,
      );
    }
    if (transcription.toLowerCase().contains("consult")) {
      Navigator.pushNamed(context, Routes.MYCONSULTATION,
          arguments: {'chatWithAtSign': '@junglegreen16inc'});
    }
    if (transcription.toLowerCase().contains("checkup")) {
      Navigator.pushNamed(context, Routes.HEALTHCHECKUP);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      floatingActionButton: FabButton(
          onTap: () {
            // Navigator.pushNamed(context, Routes.CHOOSEDOCTOR);
          },
          onLongPress: () {
            transcription = "";
            _speechRecognitionAvailable && !_isListening ? start() : null;
          },
          transcription: transcription,
          listening: _isListening),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppBar(
        elevation: 2,
        showLeadingicon: false,
        title: TextStrings().buttonExplore,
        showTitle: true,
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  top: 20.toHeight,
                  bottom: 11.toHeight,
                  left: 12.toWidth,
                  right: 12.toWidth,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextFormField(
                              showPrefixIcon: false,
                              controller: _searchCtrl,
                              keyboardType: TextInputType.text,
                              hintText: "Search Doctor",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.SEARCHRESULT,
                              arguments: {"searchString": _searchCtrl.text},
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.logoBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.search,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SpaceBox(50.toHeight),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.SPECIALITIES);
                          },
                          cardIcon: AllImages().specialistIcon,
                          cardTitle: TextStrings().specialities,
                        ),
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.MYCONSULTATION,
                                arguments: {
                                  'chatWithAtSign': '@junglegreen16inc'
                                });
                          },
                          cardIcon: AllImages().consultationIcon,
                          cardTitle: TextStrings().consultation,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.AIANALYSISSCREEN,
                            );
                          },
                          cardIcon: AllImages().ai,
                          cardTitle: "AI Analysis",
                        ),
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.MYPRESCRIPTIONS,
                            );
                          },
                          cardIcon: AllImages().prescriptionAlt,
                          cardTitle: "My Prescriptions",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CategoryCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.MEDICATIONREMINDERS,
                            );
                          },
                          cardIcon: AllImages().notifications,
                          cardTitle: "Medication Reminders",
                        ),
                      ],
                    ),
                    SpaceBox(20.toHeight),
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index, int x) {
                          return CarouselSliderItem(index: index);
                        },
                        options: CarouselOptions(
                            aspectRatio: 1.9,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((string) {
                        int index = imgList.indexOf(string);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? ColorConstants.logoBg
                                : ColorConstants.indicatorColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
