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
                                  return _buildPageItem(position,
                                      allMerchantsData.merchantList[position]);
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

  Widget _buildPageItem(int index, MerchantModel data) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index - 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Get.toNamed(RoutHelper.getMerchantDetails(index));
              Get.toNamed(RoutHelper.getMerchantDetails(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.logom!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                child: Column(
                  children: [
                    BigText(text: data.name!),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SmallText(
                        text: data.description!.length > 150
                            ? data.description!
                            : data.description! + '...'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
