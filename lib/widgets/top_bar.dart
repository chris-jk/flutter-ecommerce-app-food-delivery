import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';
import 'big_text.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      BigText(
                        text: 'Hello, Cash',
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.notifications_none,
                          color: AppColors.mainColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Gap(10),
          // search bar

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(FluentSystemIcons.ic_fluent_search_regular,
                        color: AppColors.mainColor),
                    Text('Search products, etc.'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.mainColor),
                    Text(
                      'Carmichael,Ca',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
