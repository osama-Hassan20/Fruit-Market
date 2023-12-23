import 'package:flutter/material.dart';

class ProductDetailsTitle extends StatelessWidget {
  const ProductDetailsTitle({Key? key, required this.productTitle})
      : super(key: key);
  final String productTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      productTitle,
      style: const TextStyle(fontSize: 18),
    );
  }
}
