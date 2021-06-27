import 'package:atsign_ecare/services/backend_service.dart';
import 'package:atsign_ecare/services/size_config.dart';
import 'package:atsign_ecare/utils/colors.dart';
import 'package:atsign_ecare/utils/images.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool onboardSuccess = false;
  bool sharingStatus = false;
  BackendService _backendService;

  final Permission _cameraPermission = Permission.camera;
  final Permission _storagePermission = Permission.storage;

  bool authenticating = false;

  String activeAtSign;

  @override
  void initState() {
    super.initState();

    _checkForPermissionStatus();
    _backendService = BackendService.getInstance();

    _backendService.checkToOnboard();
  }

  void _checkForPermissionStatus() async {
    final existingCameraStatus = await _cameraPermission.status;
    if (existingCameraStatus != PermissionStatus.granted) {
      await _cameraPermission.request();
    }
    final existingStorageStatus = await _storagePermission.status;
    if (existingStorageStatus != PermissionStatus.granted) {
      await _storagePermission.request();
    }
  }

  onNotificationClick(String payload) async {}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageConstants.welcomeBackground,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10.toWidth,
                          top: 10.toHeight,
                        ),
                        child: Image.asset(
                          ImageConstants.logoIcon,
                          height: 50.toHeight,
                          width: 50.toHeight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.toWidth,
                        vertical: 10.toHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "TextStrings().homeFileTransferItsSafe",
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontSize: 38.toFont,
                                  letterSpacing: 0.1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text.rich(
                              TextSpan(
                                text: "TextStrings().homeHassleFree",
                                style: TextStyle(
                                  fontSize: 15.toFont,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "TextStrings().homeWeWillSetupAccount",
                                    style: TextStyle(
                                      color: ColorConstants.fadedText,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CustomButton(
                                  buttonText: TextStrings().buttonStart,
                                  onTap: authenticating
                                      ? () {}
                                      : () async {
                                          await _backendService
                                              .checkToOnboard();
                                        }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          authenticating
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConstants.redText)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Logging in',
                            // style: CustomTextStyles.orangeMedium16,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
