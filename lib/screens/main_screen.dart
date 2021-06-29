import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/config/theme_data.dart';
import 'package:atsign_ecare/screens/account/account_screen.dart';
import 'package:atsign_ecare/screens/doctor/home/doctor_home_screen.dart';
import 'package:atsign_ecare/screens/patient/home/home_screen.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/fab.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String phoneNumber;
  final String userType;

  MainScreen({this.phoneNumber, this.userType});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showAppBar = true;
  bool showBottomNavBar = true;
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        appBar: showAppBar
            ? CustomAppBar(
                elevation: 2,
                showLeadingicon: false,
                title: TextStrings().buttonExplore,
                showTitle: true,
                trailingButtonAction: () {
                  Navigator.pushNamed(context, '/consultation');
                },
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(color: Colors.transparent),
              ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _myPage,
          children: <Widget>[
            (widget.userType == 'Doctor')
                ? DoctorHomeScreen(
                    userType: widget.userType,
                    phoneNumber: widget.phoneNumber,
                  )
                : HomeScreen(
                    userType: widget.userType,
                    phoneNumber: widget.phoneNumber,
                  ),
            AccountScreen(
              userType: widget.userType,
              phoneNumber: widget.phoneNumber,
            )
          ],
        ),
        floatingActionButton: FabButton(
          onTap: () {
            Navigator.pushNamed(context, '/choosedoctor');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: ColorConstants.logoBg,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    _myPage.jumpToPage(0);
                    setState(() {
                      showAppBar = true;
                      selectedPage = 0;
                    });
                  },
                  child: CustomPadding(
                    top: 20.toHeight,
                    child: Image.asset(
                      AllImages().homeIcon,
                      width: 54.toWidth,
                      height: 54.toHeight,
                    ),
                  ),
                ),
              ),
              Expanded(child: new Text('')),
              Expanded(
                child: CustomPadding(
                  top: 10.toHeight,
                  child: IconButton(
                      onPressed: () {
                        _myPage.jumpToPage(1);
                        setState(() {
                          showAppBar = false;
                          selectedPage = 1;
                        });
                        // (widget.userType == 'Doctor')
                        //     ? Navigator.push(context,
                        //         MaterialPageRoute(builder: (BuildContext context) {
                        //         return DoctorUserProfile(
                        //           userType: snapshot.data.userType,
                        //           phoneNumber: snapshot.data.phoneNumber,
                        //         );
                        //       }))
                        //     :
                        // Navigator.pushNamed(context, '/profile');
                      },
                      icon: Icon(
                        Icons.person,
                        size: 60.toWidth,
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
