import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/merchant_controller.dart';
import 'package:food_delivery/models/merchant_model.dart';
import 'package:food_delivery/routes/route_helper.dart';

import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../widgets/app_description.dart';
import '../../widgets/category_devider.dart';
import '../../widgets/deals_view.dart';
import '../../widgets/main_cards.dart';
import '../../widgets/top_banner.dart';
import '../../widgets/top_bar.dart';
import '../merchant/merchant_details.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  // void dispose() {
  //   pageController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(60),
        // Top bar widget
        const TopBar(),
        const Gap(20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // top slider
                GetBuilder<MercahntController>(builder: (allMerchantsData) {
                  return allMerchantsData.isLoaded
                      ? SizedBox(
                          // color: Colors.red,
                          height: Dimensions.pageView,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutHelper.merchantDetails);
                            },
                            child: PageView.builder(
                                controller: pageController,
                                itemCount: allMerchantsData.merchantList.length,
                                itemBuilder: (context, position) {
                                  return BuildPageItem(
                                      currPageValue: _currPageValue,
                                      scaleFactor: _scaleFactor,
                                      height: _height,
                                      index: position,
                                      data: allMerchantsData
                                          .merchantList[position]);
                                }),
                          ))
                      : const CircularProgressIndicator(
                          color: AppColors.mainColor,
                        );
                }),
                // top slider dots
                GetBuilder<MercahntController>(builder: (allMerchantsData) {
                  return DotsIndicator(
                    dotsCount: allMerchantsData.merchantList.isEmpty
                        ? 1
                        : allMerchantsData.merchantList.length,
                    position: _currPageValue,
                    decorator: DotsDecorator(
                      activeColor: AppColors.mainColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  );
                }),
                const CategoryDevider(
                  text: 'Deals ',
                  description: ' Deals of the day',
                ),
                // list of Deals
                SizedBox(
                  width: double.infinity,
                  height: Dimensions.pageView,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int i) {
                      return DealsView(
                        description: 'This is a description ',
                        image: 'assets/image/food0.png',
                        title: 'Title of thing',
                      );
                    },
                  ),
                ),
                const Gap(20),
                // popular text
                const CategoryDevider(
                  text: 'Popular',
                  description: 'Most Popual Stores',
                ),
                // list of stores
                GetBuilder<MercahntController>(
                  builder: (allMerchantsData) {
                    return allMerchantsData.isLoaded
                        ? SizedBox(
                            height: Dimensions.pageView,
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: allMerchantsData.merchantList.length,
                              itemBuilder: (context, index) {
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
                                                topLeft: Radius.circular(
                                                    Dimensions.radius30),
                                                topRight: Radius.circular(
                                                    Dimensions.radius30)),
                                            color: Colors.white38,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  allMerchantsData
                                                      .merchantList[index]
                                                      .logom!),
                                            )),
                                      ),
                                      // bottom half
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  Dimensions.radius20),
                                              bottomRight: Radius.circular(
                                                  Dimensions.radius20),
                                            ),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                              right: Dimensions.width10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppDecription(
                                                  text: allMerchantsData
                                                      .merchantList[index]
                                                      .name!),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : const CircularProgressIndicator(
                            color: AppColors.mainColor,
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
