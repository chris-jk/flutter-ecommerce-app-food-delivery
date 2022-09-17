import 'package:flutter/material.dart';

class LineThroughSmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight? fontWeight;
  Decoration? decoration;
  // TextOverflow overflow;

  LineThroughSmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 15,
    this.height = 1.2,
    this.fontWeight = FontWeight.w700,

    // this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      // overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
        fontWeight: fontWeight,
        decoration: TextDecoration.lineThrough,
      ),
    );
  }
}
