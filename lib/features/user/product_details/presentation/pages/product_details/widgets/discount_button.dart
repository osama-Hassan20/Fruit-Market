import 'package:flutter/material.dart';

import '../../../../../../../core/constants/color.dart';

class DiscountButton extends StatelessWidget {
  const DiscountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: mainColor
      ),
      child:
      const Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          '15% Off',
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
