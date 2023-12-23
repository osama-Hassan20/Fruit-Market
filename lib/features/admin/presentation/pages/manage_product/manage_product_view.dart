import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/manage_product/widgets/manage_product_view_body.dart';


class ManageProductView extends StatelessWidget {
  const ManageProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Product'),
          actions: const [
            Icon(Icons.delete),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body:  const ManageProductViewBody(),
      ),
    );
  }
}
