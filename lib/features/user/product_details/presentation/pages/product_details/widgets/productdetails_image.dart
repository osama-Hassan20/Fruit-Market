import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../../core/widgets/favourit_icon.dart';
import '../../../../../../admin/domain/models/pruduct_model.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 180,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                CustomCachedNetworkImage(imageUrl: productModel.image!))),
        CustomFavouriteIcon( model: productModel,),
      ],
    );
  }
}
