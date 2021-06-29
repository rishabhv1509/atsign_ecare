import 'package:at_contacts_flutter/utils/init_contacts_service.dart';
import 'package:atsign_ecare/controllers/doctors_controller.dart';
import 'package:atsign_ecare/controllers/contact_controller.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/screens/main_screen.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  final String phoneNumber;
  final String userType;
  WelcomeScreen({Key key, this.phoneNumber, this.userType}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String activeAtSign;

  BackendService _backendService;
  @override
  void initState() {
    _backendService = BackendService.getInstance();
    ContactsController().initializeContactService();
    DoctorsController().getDoctorsDetails();
    super.initState();
  }

  @override
  void dispose() {
    disposeContactsControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ColorConstants.secondaryDarkAppColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            rowCenter(
              [
                CircleAvatar(
                  radius: 100.toWidth,
                  backgroundColor: ColorConstants.logoBg,
                  child: Center(
                      child: Icon(
                    Icons.person,
                    color: ColorConstants.secondaryDarkAppColor,
                    size: 140.toFont,
                  )),
                )
              ],
            ),
            SpaceBox(50),
            Text(
              'User',
              textAlign: TextAlign.center,
              style: CustomTextStyle.titleTextStyle,
            ),
            SpaceBox(50),
            Container(
              margin: EdgeInsets.only(left: 100.toWidth, right: 100.toWidth),
              child: Text(
                TextStrings().welcomeNote,
                textAlign: TextAlign.center,
                style: CustomTextStyle.subTitleStyle,
              ),
            ),
            SpaceBox(400),
            CustomButton(
              buttonText: TextStrings().buttonStart,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MainScreen(
                    phoneNumber: "+919824280752",
                    userType: "Doctor",
                  );
                }));
              },
            ),
            SpaceBox(92),
          ],
        ));
  }

  Widget rowCenter(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: child,
    );
  }
}
