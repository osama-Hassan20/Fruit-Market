import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/admin/domain/models/pruduct_model.dart';

import '../../features/user/favourite/presentation/manager/favourite _cubit/cubit.dart';
import '../../features/user/favourite/presentation/manager/favourite _cubit/state.dart';

class CustomFavouriteIcon extends StatelessWidget {
  const CustomFavouriteIcon({Key? key, required this.model}) : super(key: key);
final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UserFavoriteCubit ,UserFavoriteStates >(
      builder: (context , state){
        var cubit = UserFavoriteCubit.get(context);
        var isFavorite = cubit.favoritesMap[model.uId] ?? false;
        return Positioned(
          top: 5,
          right: 5,
          child:
          InkWell(
            onTap: () {
              cubit.searchIsFavorite(model);
            },
            child:  CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
