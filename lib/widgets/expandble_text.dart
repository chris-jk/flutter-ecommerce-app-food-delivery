import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandText extends StatefulWidget {
  final String text;
  const ExpandText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandText> createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  late String firstHalfText;
  late String secondHalfText;

  bool textHidden = true;

  double textHeight = Dimensions.screenHeight / 7.03;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalfText = widget.text.substring(0, textHeight.toInt());
      secondHalfText =
          widget.text.substring(textHeight.toInt(), widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalfText.isEmpty
          ? SmallText(
              text: firstHalfText,
            )
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    size: Dimensions.font16,
                    color: AppColors.paraColor,
                    text: textHidden
                        ? (firstHalfText + '...')
                        : firstHalfText + secondHalfText),
                InkWell(
                    onTap: () {
                      setState(() {
                        textHidden = !textHidden;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          size: Dimensions.font16,
                          text: textHidden ? 'Show more' : 'Show less',
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          textHidden
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    )),
              ],
            ),
    );
  }
}
