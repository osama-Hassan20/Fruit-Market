import 'package:flutter/material.dart';

import '../../../manager/user_layout_cubit/cubit.dart';

Widget counterItem({required int count , required double spaceH})=>
    Positioned(
  top: 0,
  right: spaceH,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      '$count',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    ),
  ),
);