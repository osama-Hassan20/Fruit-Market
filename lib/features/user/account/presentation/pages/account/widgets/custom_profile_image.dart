import 'package:flutter/material.dart';

import '../../../../../../../core/constants/color.dart';
import '../../../../../../../core/widgets/custom_cached_network_image.dart';

class CustomCoverImage extends StatelessWidget {
  const CustomCoverImage({Key? key, required this.coverImage}) : super(key: key);
final String coverImage;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox(
          height: 180.0,
          width: double.infinity,
          child: CustomCachedNetworkImage(imageUrl: coverImage),
        ),
        Container(
          height: 180,
          width: double.infinity,
          color: mainColor.withOpacity(0.5),
        ),
      ],
    );
  }
}
