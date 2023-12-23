import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({Key? key, required this.productBody})
      : super(key: key);
  final String productBody;

  @override
  Widget build(BuildContext context) {
    return Text(
      productBody,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
