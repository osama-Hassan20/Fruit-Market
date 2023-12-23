import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/features/user/favourite/presentation/manager/favourite%20_cubit/state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../core/widgets/favourit_icon.dart';
import '../../../../../user/favourite/presentation/manager/favourite _cubit/cubit.dart';
import '../../../../domain/models/pruduct_model.dart';
import 'custom_product_image.dart';

Widget buildProductItem(ProductModel model, context) => Container(
  width: 120,
  height: 270,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          SizedBox(
            height: 150,
            // width: 120,
            child: CustomProductImage(
              imageUrl: model.image!,
            ),
          ),
          Positioned(
            bottom:0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text('Best Seller',style: TextStyle(
                    color: Colors.white
                ),),
              ),
            ),
          ),
          CustomFavouriteIcon(model: model),
        ],
      ),
      const SizedBox(
        height: 2,
      ),
      const Row(
        mainAxisSize: MainAxisSize.min,
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
        height: 2,
      ),
      Text(
        model.name!,
        style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 0,
      ),
      Row(
        children: [
          const Text(
            'EGP ',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            '${model.price} Per/Kg',
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
            '${model.discount} Per/Kg',
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              fontSize: 12,
              fontFamily: 'Poppins',
              color: Colors.grey,
            ),
          ),
        ],
      ),

       Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            const Text(
              '15% Off',
              // '${(100-((model.price-model.discount)/model.price)*100).toStringAsFixed(2)} OFF',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            InkWell(
              onTap: (){
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  ),
);
