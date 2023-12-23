import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../core/constants/color.dart';
import 'custom_conditional_builder_fallback.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        imageBuilder: (context, imageProvider) => Image(
          image: imageProvider,
          fit: BoxFit.fill,
        ),
        placeholder: (context, url) =>  const CustomConditionalBuilderFallback(),
        errorWidget: (context, url, error) {
          print(error.toString());
          return  const CustomConditionalBuilderFallback();
        });
  }
}
