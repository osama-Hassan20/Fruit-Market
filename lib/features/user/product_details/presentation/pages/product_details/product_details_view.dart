import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/features/admin/domain/models/pruduct_model.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.productModel}) : super(key: key);
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
            onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'DETAILS'
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainColor,
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Add to cart'),
      ),
      body: ProductDetailsViewBody(productModel: productModel),
    );
  }
}
