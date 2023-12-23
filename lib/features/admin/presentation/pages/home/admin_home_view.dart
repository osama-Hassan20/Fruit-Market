import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/build_alert_dialog.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_buttons.dart';
import 'package:fruit_market_ecommerce/core/widgets/navigate.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/add_product_view.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';
import '../../../../auth/data/respotireis/auth_repo_impl.dart';
import '../add_pruduct/widgets/name_item.dart';
import '../add_pruduct/widgets/selected_category.dart';
import '../manage_product/manage_product_view.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('AdminHomeView'),
        
        actions:  [
          InkWell(
            onTap: (){
              AuthRepoImpl().logOut(context);
            },
              child: const Center(child: Text('logOut')))
          // defaultTextButton(function: AuthRepoImpl().logOut(context), text: 'logOut')
        ],
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultButton(function: (){
            buildAlertDialog(context: context,
                title: '',
                contentWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameItem(name: 'Choose Category'),
                    const SelectedCategory(),
                  ],
                ),
                textButtonRight: 'ADD',
                textButtonLeft: 'BACK',
                onPressedRight: (){
              if(selectedCategory != null){
                Navigator.pop(context);
                navigateTo(context, const AddProductView());
              }
                },
                onPressedLeft: (){
                  selectedCategory = null;
                  Navigator.pop(context);
                },
            );

          }, text: 'add Product'),


          const SizedBox(height: 20,),
          defaultButton(function: (){
            navigateTo(context, const ManageProductView());
          }, text: 'manage Product'),
        ],
      ),
    );
  }
}
