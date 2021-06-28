import 'package:at_contacts_flutter/utils/init_contacts_service.dart';
import 'package:atsign_ecare/controllers/add_doctors_controller.dart';
import 'package:atsign_ecare/controllers/contact_controller.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/common_widgets/app_bar.dart';
import 'package:atsign_ecare/screens/common_widgets/custom_button.dart';
import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/services/size_config.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

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
    DoctorsController().getDetails();
    super.initState();
  }

  @override
  void dispose() {
    disposeContactsControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 2,
        showBackButton: true,
        title: 'HOME PAGE',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonText: 'Contacts',
              height: 40.toHeight,
              isOrange: true,
              onPressed: () {
                Navigator.pushNamed(context, Routes.CONTACT_SCREEN, arguments: {
                  'asSelectionScreen': true,
                  'selectedList': (s) {
                    print(s);
                    DoctorsController().addDoctor(s[0],
                        {'doctorDetails': 'he is a nuero', 'name': 'RISHABH'});
                  }
                });
              },
            ),
            CustomButton(
              buttonText: 'Contacts',
              height: 40.toHeight,
              isOrange: true,
              onPressed: () async {
                await _backendService
                    .deleteAtSignFromKeyChain('@junglegreen16inc');
              },
            )
          ],
        ),
      ),
    );
  }
}
