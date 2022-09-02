import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:gap/gap.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class DealsView extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  // final String price;

  const DealsView(
      {required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.pageViewContainer * 1.20,
      height: Dimensions.pageView,
      margin: EdgeInsets.only(
          left: Dimensions.width10 / 1.2,
          right: Dimensions.width10 / 1.2,
          top: Dimensions.height10),
      child: Column(
        children: [
          /*
            Top part of the card
            */
          Container(
            decoration: const BoxDecoration(
              color: AppColors.iconColor2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    BigText(
                      text: 'This some shyt',
                      color: Colors.white,
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  children: const [
                    Text(
                      'Natural heal...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // /* middle part of the card with - - - -  */
          Container(
            color: AppColors.iconColor2,
            child: Row(
              children: [
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => const SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //  bottom half image section
          Container(
            height: Dimensions.listViewImg,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radius30),
                  bottomRight: Radius.circular(Dimensions.radius30)),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://picsum.photos/250?image=9'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
