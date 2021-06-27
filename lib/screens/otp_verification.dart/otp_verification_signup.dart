import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/onboarding/widgets/custom_flat_button.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class SignUpOtpVerification extends StatelessWidget {
  final String userType, name, phoneNumber, email;
  SignUpOtpVerification(
      {Key key, this.userType, this.name, this.phoneNumber, this.email})
      : super(key: key);

  String otpNumber;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ColorConstants.secondaryDarkAppColor,
        appBar: CustomAppBar(
          showLeadingicon: true,
          leadingButtonAction: () {
            Navigator.pop(context);
          },
          trailingButtonAction: () {
            Navigator.pushNamed(context, Routes.CONSULTATION);
          },
          leadingIcon: Icons.arrow_back_ios,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            rowStart([
              CustomPadding(
                top: 60.0,
                left: 50.0,
                child: Text(
                  TextStrings().otpTitle,
                  style: CustomTextStyle.titleTextStyle,
                ),
              )
            ]),
            rowStart([
              CustomPadding(
                top: 20.0,
                left: 55.0,
                child: Text(
                  TextStrings().otpSubTitleText + phoneNumber,
                  style: CustomTextStyle.subTitleStyle,
                ),
              ),
            ]),
            SpaceBox(150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinEntryTextField(
                  fields: 6,
                  onSubmit: (String pin) async {},
                ),
              ],
            ),
            SpaceBox(150),
            Container(
              alignment: Alignment.bottomCenter,
              child: CustomFlatButton(
                displayColumn: true,
                onTap: () {
                  //Resend OTP Function
                },
                accountTypedes: TextStrings().otpActiondes,
                accountType: TextStrings().otpAction,
              ),
            )
          ],
        )));
  }

  Widget rowStart(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: child,
    );
  }
}
