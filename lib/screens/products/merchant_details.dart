import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_description.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/merchant_controller.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandble_text.dart';

class MerchantDetails extends StatelessWidget {
  int pageId;
  MerchantDetails({required this.pageId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var merchant = Get.find<MercahntController>().merchantList[pageId];
    // print('page id is ' + pageId.toString());
    // print(merchant.name!.toString());

    return Scaffold(
      body: Stack(
        children: [
          // img
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: Dimensions.listViewImg,
              height: Dimensions.productImageDetail,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(merchant.logom!),
              )),
            ),
          ),
          // buttons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutHelper.initial);
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_bag_outlined,
                )
              ],
            ),
          ),
          // Description
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.productImageDetail - 20,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius30),
                  topRight: Radius.circular(Dimensions.radius30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppDecription(
                        text: merchant.name!,
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.width15),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: 'This some shyt'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandText(
                          text:
                              ' lorem ipsum c ipsum dolo sit amet, consectetur lorum50ipsum c ipsum dolo sit amet,lorum50ipsum c ipsum dolo sit amet, consectetur lorum50ipsum c ipsum dolo sit amet, consectetur lorum50ipsum c ipsum dolo sit amet, consectetur lorum50'),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: 'This some shyt'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandText(
                          text:
                              ' lorem ipsum c ipsum dolo sit amet, consectetur lorum50ipsum c ipsum dolo sit amet,lorum50ipsum c ipsum dolo sit amet, consectetur lorum50ipsum c ipsum dolo sit amet, consectetur lorum50ipsum c ipsum dolo sit amet, consectetur lorum50'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomAddToBag / 2,
        padding: EdgeInsets.only(
            left: Dimensions.width20, right: Dimensions.width20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.width15),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  BigText(text: 'Call Now', color: Colors.white),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.width15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        BigText(text: 'Email'),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
