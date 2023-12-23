import 'package:flutter/material.dart';

import '../../../../../layout/presentation/manager/user_layout_cubit/cubit.dart';

List<Tab> tabBarItem = [
  customTextTabBarItem(name: 'Vegetables'),
  customTextTabBarItem(name: 'Fruits'),
  customTextTabBarItem(name: 'Dry Fruits'),
];

Tab customTextTabBarItem({required String name}) => Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(name),
      ),
    );
