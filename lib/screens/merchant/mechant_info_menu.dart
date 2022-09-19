import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class MerchantInfo extends StatelessWidget {
  const MerchantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: 'Merchant Name',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          BigText(
            text: 'Merchant Description',
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 5,
              ),
              BigText(
                text: '4.5',
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                width: 5,
              ),
              BigText(
                text: '(100)',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              BigText(
                text: 'Location',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.timer,
                color: Colors.green,
              ),
              const SizedBox(
                width: 5,
              ),
              BigText(
                text: 'Open Now',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 5,
              ),
              BigText(
                text: 'Phone Number',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.email,
                color: Colors.purple,
              ),
              const SizedBox(
                width: 5,
              ),
              BigText(text: 'Email'),
            ],
          ),
        ],
      ),
    );
  }
}
