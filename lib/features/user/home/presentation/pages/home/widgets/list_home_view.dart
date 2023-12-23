import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/user/home/presentation/pages/fruits/fruits_view.dart';
import 'package:fruit_market_ecommerce/features/user/home/presentation/pages/vegetables/vegetables_view.dart';
import '../../dry_fruits/dry_fruits_view.dart';

List<Widget> homeViews = [
  const VegetablesView(),
  const FruitsView(),
  const DryFruitsView(),
];
