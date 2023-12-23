import 'package:flutter/material.dart';
import '../../../../../account/presentation/pages/account/account_view.dart';
import '../../../../../favourite/presentation/pages/favourite/favourite_view.dart';
import '../../../../../home/presentation/pages/home/home_view.dart';
import '../../../../../shopping/presentation/pages/shopping/shopping_view.dart';

List<Widget> userViews = [
  const HomeView(),
  const ShoppingView(),
  const FavoriteView(),
  const AccountView(),
];
