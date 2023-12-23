import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/widgets/navigate.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/manager/delete_product_cubit/cubit.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/manager/delete_product_cubit/states.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/manage_product/widgets/build_product_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../core/constants/color.dart';
import '../../../../../../core/widgets/custom_menu.dart';
import '../../../manager/add_and_update_product_cubit/cubit.dart';
import '../../../manager/add_and_update_product_cubit/states.dart';
import '../../../manager/get_product_cubit/cubit.dart';
import '../../edit_product/edit_product_view.dart';

class ManageProductViewBody extends StatelessWidget {
  const ManageProductViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      GetProductCubit.get(context).getProducts();
      return BlocBuilder<AddAndUpdateProductCubit, AddProductStates>(
        builder: (context, state) {
          var getCubit = GetProductCubit.get(context);
          return ConditionalBuilder(
            condition: getCubit.products.isNotEmpty,
            builder: (context) => Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getCubit.products.length,
                        itemBuilder: (context , index) =>
                            GestureDetector(
                                onTapUp: (details) async {
                                  double dx = details.globalPosition.dx;
                                  double dy = details.globalPosition.dy;
                                  double dx2 = MediaQuery.of(context).size.width - dx;
                                  double dy2 = MediaQuery.of(context).size.width - dy;
                                  await showMenu(
                                    context: context,
                                    position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                                    items: [
                                      MyPopupMenuItem(
                                      onClick: () {
                                        Navigator.pop(context);
                                        navigateTo(context,  EditProductView(id: getCubit.products[index].uId!,image: getCubit.products[index].image!,));
                                        productImage = getCubit.products[index].image!;
                                        selectedCategory = getCubit.products[index].category!;
                                        nameProductController.text = getCubit.products[index].name!;
                                        priceProductController.text = getCubit.products[index].price!;
                                        discountProductController.text = getCubit.products[index].discount!;
                                        descriptionProductController.text = getCubit.products[index].description!;
                                        selectedSubCategory = getCubit.products[index].subCategory!;
                                        selectedRate = getCubit.products[index].rate!;
                                        nutritionProduct = getCubit.products[index].nutrition!;
                                        selectedSubCategory=getCubit.products[index].subCategory;

                                      },
                                        childWidget: Text('Edit'),
                                    ),
                                      MyPopupMenuItem(
                                        onClick: () {
                                          BlocBuilder<DeleteProductCubit,DeleteProductStates>(
                                            builder: (context , state){
                                              var delCubit = DeleteProductCubit.get(context);
                                              return delCubit.deleteProduct(getCubit.products[index].uId);
                                            },
                                          );

                                          Navigator.pop(context);
                                        },
                                        childWidget: Text('Delete'),
                                      ),
                                    ]
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: buildProductItem(getCubit.products[index], context),
                                )),

                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context , index) =>Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: buildProductItem(getCubit.products[1], context),
                        ),

                      ),
                    ),const SizedBox(height: 20,),
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context , index) =>Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: buildProductItem(getCubit.products[1], context),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: mainColor,
                size: 50,
              ),
            ),
          );
        },
      );
    });
  }
}
