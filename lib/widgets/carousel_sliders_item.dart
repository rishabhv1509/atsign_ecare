import 'package:atsign_ecare/config/image_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:flutter/material.dart';

class CarouselSliderItem extends StatefulWidget {
  final String image;
  final String imageTitle;
  CarouselSliderItem({this.image, this.imageTitle});
  @override
  _CarouselSliderItemState createState() => _CarouselSliderItemState();
}

class _CarouselSliderItemState extends State<CarouselSliderItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(5.0),
      width: SizeConfig().screenWidth,
      height: 150.toHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: AssetImage(AllImages().slider), fit: BoxFit.cover)),
    );
  }
}
