import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'small_text.dart';

class CategoryDevider extends StatelessWidget {
  final String text;
  final String description;
  const CategoryDevider(
      {Key? key, required this.text, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // popular text
        Container(
      margin: EdgeInsets.only(left: Dimensions.width30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              BigText(text: text),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: description,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              print('see all');
            },
            child: Column(
              children: [
                Row(
                  children: const [
                    Text('See all'),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
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
