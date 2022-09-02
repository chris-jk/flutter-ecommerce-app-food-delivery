import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/app_description.dart';

import '../utils/dimensions.dart';

class MainCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  // final String price;

  MainCard(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.pageViewContainer * 1.05,
      height: Dimensions.pageView,
      margin: EdgeInsets.only(
          left: Dimensions.width10 / 2,
          right: Dimensions.width10 / 2,
          top: Dimensions.height10),
      child: Column(
        children: [
          // image section
          Container(
            height: Dimensions.listViewImg,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius30),
                    topRight: Radius.circular(Dimensions.radius30)),
                color: Colors.white38,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                )),
          ),
          // bottom half
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radius20),
                  bottomRight: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppDecription(text: title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
