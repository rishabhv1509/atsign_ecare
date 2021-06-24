import 'package:atsign_ecare/screens/common_widgets/app_bar.dart';

import 'package:atsign_ecare/utils/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:atsign_ecare/services/size_config.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showTitle: true,
        title: TextStrings().termsAppBar,
      ),
      // endDrawer: SideBarWidget(),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(vertical: 20.toHeight, horizontal: 20.toWidth),
        child: Column(
          children: [
            Container(
              height: 723.toHeight,
              child: Text(
                TextStrings().termsAndConditions,
                // style: CustomTextStyles.secondaryRegular14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
