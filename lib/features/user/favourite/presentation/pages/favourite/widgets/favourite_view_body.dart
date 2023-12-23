import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/core/widgets/navigate.dart';
import 'package:fruit_market_ecommerce/features/user/favourite/presentation/manager/favourite%20_cubit/state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../../core/widgets/custom_empty_item.dart';
import '../../../../../../admin/presentation/pages/manage_product/widgets/build_product_item.dart';
import '../../../../../product_details/presentation/pages/product_details/product_details_view.dart';
import '../../../manager/favourite _cubit/cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      UserFavoriteCubit.get(context).getFavoriteProducts();
      return BlocBuilder<UserFavoriteCubit, UserFavoriteStates>(
        builder: (context, state) {
          var cubit = UserFavoriteCubit.get(context);
          return ConditionalBuilder(
            condition: state is! GetFavoriteProductsLoadingState,
            builder: (context) =>
                // ignore: unnecessary_null_comparison
                cubit.favoriteProducts == null
                    ? Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: mainColor,
                          size: 50,
                        ),
                      )
                    : Scaffold(
                        body: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: GridView.count(
                                  childAspectRatio: 1 / 1.6,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  children: List.generate(
                                      cubit.favoriteProducts.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                              onTap: (){
                                                navigateTo(context, ProductDetailsView(productModel: cubit.favoriteProducts[index],));
                                              },
                                              child: buildProductItem(
                                                  cubit.favoriteProducts[index],
                                                  context),
                                            ),
                                          )),
                                ),
                              ),
                              if (cubit.favoriteProducts.isEmpty)
                                const CustomEmpty(
                                    itemName: 'Favorite', icon: Icons.favorite),
                            ],
                          ),
                        ),
                      ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      );
    });
  }
}
