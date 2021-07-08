import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/models/doctor.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/patient/choose_doctor/widgets/choose_doctor_card.dart';
import 'package:atsign_ecare/utils/constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:atsign_ecare/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final String searchString;

  const SearchResult({Key key, @required this.searchString}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult>
    with SingleTickerProviderStateMixin {
  List<Doctor> result = [];

  @override
  void initState() {
    MixedConstants.doctors.forEach((doc) {
      if (doc.name.contains(widget.searchString)) result.add(doc);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        showTitle: true,
        title: "Search Result",
        trailingButtonAction: () {
          Navigator.pushNamed(context, Routes.CONSULTATION);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 0; i < result.length; i++)
              DoctorCard(doctor: result[i]),
          ],
        ),
      ),
    );
  }
}
