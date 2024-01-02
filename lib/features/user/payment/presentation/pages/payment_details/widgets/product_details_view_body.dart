import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_cached_network_image.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/product_details_title.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/productdetails_image.dart';

import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_show_rating.dart';
import '../../../../../../admin/domain/models/pruduct_model.dart';
import 'discount_button.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsImage(
                    productModel: productModel,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ProductDetailsTitle(productTitle: productModel.name!),
                      const Spacer(),
                       DiscountButton(discount: productModel.discount),
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Text(
                      'Grapes will provide natural nutrients. The Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
                      style: Styles.textStyle12),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShowRatingStars(
                        rating: productModel.rate.toDouble(),
                        size: 16,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '(${productModel.numberOfRatings})',
                        style: Styles.textStyle10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Nutrition', style: Styles.textStyle18),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(productModel.nutrition!.replaceAll(' ', '\n'),
                      style: Styles.textStyle12),

                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text('EGP ',//
                      style: Styles.textStyle12
                          .copyWith(fontWeight: FontWeight.w400)),
                  Text('${double.parse(productModel.price)-double.parse(productModel.discount)} Per/Kg',
                      style: Styles.textStyle12
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text('EGP ',
                    style: Styles.textStyle12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),),
                  Text(
                    '${productModel.price} Per/Kg',
                    style:
                    Styles.textStyle12.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
