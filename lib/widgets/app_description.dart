import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppDecription extends StatelessWidget {
  final String text;

  const AppDecription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10 / 2,
        ),
        BigText(text: text, size: Dimensions.font20),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
                icon: Icons.access_time,
                text: '30-60 min',
                iconColor: AppColors.iconColor2),
            // IconAndText(
            //     icon: Icons.location_on,
            //     text: '3.9 mi',
            //     iconColor: AppColors.mainColor),
            IconAndText(
                icon: Icons.star,
                text: '4.5(20)',
                iconColor: AppColors.iconColor1),
          ],
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        Row(
          children: [
            const IconAndText(
                icon: Icons.monetization_on_rounded,
                text: 'Deals',
                iconColor: AppColors.mainColor),
            SizedBox(
              width: Dimensions.width10,
            ),
            const IconAndText(
                icon: Icons.monetization_on_rounded,
                text: '\$10 Min',
                iconColor: AppColors.iconColor1),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
      ],
    );
  }
}
