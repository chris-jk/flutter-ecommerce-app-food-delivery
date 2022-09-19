import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../models/merchant_model.dart';
import '../routes/route_helper.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class BuildPageItem extends StatelessWidget {
  const BuildPageItem({
    Key? key,
    required double currPageValue,
    required double scaleFactor,
    required double height,
    required this.index,
    required this.data,
  })  : _currPageValue = currPageValue,
        _scaleFactor = scaleFactor,
        _height = height,
        super(key: key);

  final double _currPageValue;
  final double _scaleFactor;
  final double _height;
  final int index;
  final MerchantModel data;

  @override
  Widget build(BuildContext context) {
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
