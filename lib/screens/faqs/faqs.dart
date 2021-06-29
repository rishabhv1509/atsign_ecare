import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/utils/colors.dart';
import 'package:atsign_ecare/utils/faq_data.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showTitle: true,
        title: "FAQ",
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 16.toWidth, vertical: 16.toHeight),
        child: ListView.separated(
          itemCount: FAQData.data.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10.toHeight,
          ),
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(10.toFont),
            child: Container(
              color: ColorConstants.inputFieldColor,
              child: Theme(
                data: ThemeData(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: Text(
                    FAQData.data[index]["question"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.toFont,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        16.toWidth,
                        0,
                        16.toWidth,
                        14.toHeight,
                      ),
                      child: Text(
                        FAQData.data[index]["answer"],
                        style: TextStyle(
                            color: ColorConstants.fadedText,
                            fontSize: 12.toFont,
                            height: 1.7,
                            letterSpacing: 0.1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
