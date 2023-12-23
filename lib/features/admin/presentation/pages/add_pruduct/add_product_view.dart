import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/navigate.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/home/admin_home_view.dart';

import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('add Product'),
          leading: IconButton(
            onPressed: (){
              selectedCategory=null;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: const [
            Icon(Icons.delete),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body:  SingleChildScrollView(child: AddProductViewBody()),
      ),
    );
  }
}
