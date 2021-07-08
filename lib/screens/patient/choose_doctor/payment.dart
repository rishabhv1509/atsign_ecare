import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/models/consultation.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/text_strings.dart';
import 'package:atsign_ecare/utils/text_styles.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:atsign_ecare/widgets/custom_button.dart';
import 'package:atsign_ecare/widgets/custom_padding.dart';
import 'package:atsign_ecare/widgets/space_box.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final Consultation consultation;

  const Payment({Key key, @required this.consultation}) : super(key: key);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedPayment = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
        elevation: 2,
        showLeadingicon: true,
        leadingButtonAction: () {
          Navigator.pop(context);
        },
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
        showTitle: true,
        title: TextStrings().payment,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          paymentMethod(
              paymentMethod: '******** 4343',
              imageWidth: 40,
              imageHeight: 40,
              image: AllImages().deleteButton),
          paymentMethod(
              paymentMethod: TextStrings().card,
              imageWidth: 84,
              imageHeight: 28,
              image: AllImages().cardIcon),
          rowCenter([
            Container(
              margin: EdgeInsets.only(top: 40.toHeight, bottom: 20.toHeight),
              width: SizeConfig().screenWidth / 1.15,
              height: 260.toHeight,
              decoration: BoxDecoration(
                  color: ColorConstants.fadedGrey,
                  borderRadius: BorderRadius.circular(2)),
              child: CustomPadding(
                left: 30,
                right: 30,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: TextStrings().cardNumber,
                          labelStyle: CustomTextStyle.paymentCardStyle),
                    ),
                    Row(
                      children: [
                        CustomPadding(
                          top: 50,
                          child: Text(
                            TextStrings().expiry,
                            style: CustomTextStyle.paymentCardStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.toWidth),
                          width: 170.toWidth,
                          child: TextFormField(
                            decoration: InputDecoration(),
                          ),
                        ),
                        CustomPadding(
                          left: 20.toWidth,
                          top: 50,
                          child: Text(
                            TextStrings().cvv,
                            style: CustomTextStyle.paymentCardStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.toWidth),
                          width: 170.toWidth,
                          child: TextFormField(
                            decoration: InputDecoration(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SpaceBox(900.toHeight),
          CustomButton(
            buttonText: TextStrings().pay,
            onTap: () {
              Navigator.pushNamed(context, Routes.PAYMENTCOMPLETED,
                  arguments: {"consultation": widget.consultation});
            },
          ),
        ]),
      ),
    );
  }

  Widget paymentMethod(
      {String paymentMethod,
      double imageWidth,
      double imageHeight,
      String image}) {
    return CustomPadding(
      top: 40,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 450.toWidth,
            child: RadioListTile(
              dense: true,
              activeColor: ColorConstants.logoBg,
              groupValue: selectedPayment,
              title: Text(
                paymentMethod,
                style: CustomTextStyle.appBarTitleStyle,
              ),
              value: '1',
              onChanged: (val) {
                setState(() {
                  selectedPayment = val;
                });
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: imageWidth.toWidth,
              height: imageHeight.toHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.contain)),
            ),
          )
        ],
      ),
    );
  }

  Widget rowCenter(List<Widget> child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: child,
    );
  }
}
