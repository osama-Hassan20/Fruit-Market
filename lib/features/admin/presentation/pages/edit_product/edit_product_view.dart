import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/edit_product/widgets/edit_product_view_body.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({Key? key, required this.id, required this.image}) : super(key: key);
  final String id;
  final String image;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('edit Product'),
      ),
      body:  SingleChildScrollView(child: EditProductViewBody(id: id,image: image,)),
    );
  }
}
