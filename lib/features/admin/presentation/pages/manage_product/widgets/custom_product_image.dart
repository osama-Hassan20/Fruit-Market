import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_cached_network_image.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CustomCachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
