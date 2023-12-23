import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_cached_network_image.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/product_details_title.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/productdetails_image.dart';

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
              const DiscountButton(),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          const Text(
            'Grapes will provide natural nutrients. The Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect your body from Cancer.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '(116)',
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Nutrition',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productModel.nutrition!
                .replaceAll(' ', '\n'),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Spacer(),
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'EGP ',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '${productModel.price} Per/Kg',
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'EGP ',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12, fontWeight: FontWeight.w400,color: Colors.grey,),
                  ),
                  Text(
                    '${productModel.discount} Per/Kg',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
