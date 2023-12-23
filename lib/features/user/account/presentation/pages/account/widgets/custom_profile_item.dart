import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';


class CustomUserAccount extends StatelessWidget {
  const CustomUserAccount({Key? key, required this.title, required this.body}) : super(key: key);
  final String title,body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: mainColor
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(body,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: mainColor,
          ),
        ],
      ),
    );
  }
}
