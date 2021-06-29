import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showTitle: true,
        title: "",
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
                "",
                // style: CustomTextStyles.secondaryRegular14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
