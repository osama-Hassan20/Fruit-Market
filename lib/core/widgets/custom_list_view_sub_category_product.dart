import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/widgets/navigate.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/manage_product/widgets/build_product_item.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/product_details_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../../core/constants/color.dart';
import '../../features/admin/presentation/manager/get_product_cubit/cubit.dart';
import '../../features/admin/presentation/manager/get_product_cubit/states.dart';
import 'custom_conditional_builder_fallback.dart';

class CustomListViewSubCategoryProduct extends StatelessWidget {
  const CustomListViewSubCategoryProduct({Key? key, required this.category, required this.subCategory}) : super(key: key);
  final String category ;
  final String subCategory ;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      GetProductCubit.get(context).getProducts();
      return BlocBuilder<GetProductCubit, GetProductStates>(
        builder: (context, state) {
          var getCubit = GetProductCubit.get(context);
          return ConditionalBuilder(
            condition: getCubit.products.isNotEmpty,
            builder: (context) =>
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getCubit.products.length,
                    itemBuilder: (context , index) =>
                    getCubit.products[index].category ==category&& getCubit.products[index].subCategory==subCategory?
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                            child: InkWell(
                              onTap: (){
                                navigateTo(context, ProductDetailsView(productModel: getCubit.products[index]));
                              },
                                child: buildProductItem(
                                    getCubit.products[index], context)),
                          ):const SizedBox(),

                  ),
                ),
            fallback: (context) =>  const CustomConditionalBuilderFallback(),
          );
        },
      );
    });
  }
}
