import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/features/admin/domain/models/pruduct_model.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/product_details_view_body.dart';
import 'package:fruit_market_ecommerce/features/user/shopping/domain/models/shop_model.dart';
import 'package:fruit_market_ecommerce/features/user/shopping/presentation/manager/shopping%20_cubit/state.dart';

import '../../../../../../core/constants/variables.dart';
import '../../../../../../core/widgets/custom_arrow_back.dart';
import '../../../../layout/presentation/pages/user_layout/widgwts/counter_item.dart';
import '../../../../shopping/presentation/manager/shopping _cubit/cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.productModel}) : super(key: key);
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: const CustomArrowBack(),
        title: const Text(
          'DETAILS'
        ),
      ),
      floatingActionButton: BlocBuilder<UserShoppingCubit, UserShoppingStates>(
        builder: (context , state){
          var cubit =  UserShoppingCubit.get(context);
          String buttonText = 'Add to cart';
          int q = 0;
          for (int i = 0; i <cubit.cartsData.length; i++) {
            if (cubit.cartsData[i][columnUIdProduct] == productModel.uId) {
              buttonText = 'product in Cart';
              q=cubit.cartsData[i][columnQuantityProduct];
            }
          }
          return FloatingActionButton.extended(
            backgroundColor: mainColor,
            onPressed: () {
              print('object');
              cubit.insertCartToDatabase(
                CartProductModel(
                  image: productModel.image,
                  name: productModel.name,
                  uId:  productModel.uId,
                  discount: productModel.discount,
                  price: productModel.price,
                  quantity: 1,
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if(q !=0)
                  counterItem(count: q, spaceH: 0),
              ],
            ),

            label:  Text(buttonText),
          );
        },
      ),
      body: ProductDetailsViewBody(productModel: productModel),
    );
  }
}
