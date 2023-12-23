import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/manager/user_layout_cubit/cubit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'counter_item.dart';

// int cartItemsCount = 0;
List<GButton> gButtonItem(context) => [
      const GButton(
        icon: Icons.home,
        text: 'Home',
      ),
      // const GButton(
      //   icon: Icons.add_shopping_cart,
      //   text: 'Shopping',
      // ),
      GButton(
        icon: Icons.add_shopping_cart_outlined,
        text: 'Shopping',
        leading: UserAppCubit.get(context).cartItem > 0
            ? Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Icon(Icons.add_shopping_cart_outlined),
                  ),
                  counterItem(
                      count: UserAppCubit.get(context).cartItem, spaceH: 6),
                ],
              )
            : Icon(Icons.add_shopping_cart_outlined),
      ),
      const GButton(
        icon: Icons.favorite_border,
        text: 'Favorite',
      ),
      const GButton(
        icon: Icons.person,
        text: 'Account',
      ),
    ];
