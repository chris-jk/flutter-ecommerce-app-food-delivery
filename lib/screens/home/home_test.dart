import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/colors.dart';
import '../../widgets/deals_view.dart';
// import '/utils/app_styles.dart';
// import 'deals_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlackColor,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                children: [
                  //hello

                  // deliver to
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text('Deliver to'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.mainColor),
                              const Text(
                                'Kenneth blvd, Car...',
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text('Home',
                                  style: TextStyle(color: AppColors.mainColor)),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // search bar
                  const Gap(20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                                FluentSystemIcons.ic_fluent_search_regular),
                            const Text(
                              'Search products, etc.',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: AppColors.mainColor),
                            const Text(
                              'Carmichael,Ca',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Featured
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Featured'),
                      InkWell(
                        onTap: () {
                          print('see all');
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'See all',
                                ),
                                Icon(Icons.arrow_forward_ios, size: 15),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // featured items
                  const Gap(20),
                  const DealsView(
                    image: 'assets/images/food1.png',
                    title: 'Chicken',
                    description: 'Chicken with rice and salad',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
