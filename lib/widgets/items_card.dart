import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/merchant_items_controller.dart';

import 'package:food_delivery/widgets/small_text.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';
import 'line_through_small_text.dart';

class ItmeCard extends StatelessWidget {
  const ItmeCard(MercahntItemsController itmesData, {Key? key})
      : super(key: key);

  get index => null;

  @override
  Widget build(BuildContext context) {
    var itmesData;
    return Column(
      children: [
        // image
        Container(
          width: 200,
          height: Dimensions.pageView * 0.8,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(itmesData.merchantItems[0][index].logom),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // item bottom details
        Container(
          padding: const EdgeInsets.only(left: 20),
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category Name
                    SmallText(
                      size: 16,
                      text: itmesData.merchantItems[0][index].categoryName,
                    ),
                    Gap(5),
                    // rating
                    IconAndText(
                      icon: Icons.star,
                      iconColor: AppColors.mainColor,
                      text: 4.8.toString(),
                    ),
                  ],
                ),
              ),
              Gap(5),
              // this is the name of the item
              BigText(
                text: itmesData.merchantItems[0][index].name,
              ),
              // show star rating

              Gap(5),
              // show price and discount
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_sharp,
                        color: Color.fromARGB(255, 234, 56, 12),
                      ),
                      Gap(5),
                      LineThroughSmallText(
                        size: 18,
                        text:
                            itmesData.merchantItems[0][index].price.toString(),
                      ),
                    ],
                  ),
                ],
              ),
              // make row with  add to cart button
              Gap(5),
              Container(
                width: 190,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                        ),
                        BigText(
                          fontWeight: FontWeight.w900,
                          size: 18,
                          text: 500.toString(),
                          // text: itmesData
                          //     .merchantItems[0][index]
                          //     .discountedPrice
                          //     .toString(),
                        ),
                      ],
                    ),
                    Gap(10),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor,
                      ),
                      child: Center(
                        child: SmallText(
                          text: "Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
