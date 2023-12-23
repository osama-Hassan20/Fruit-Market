import 'package:flutter/material.dart';

Widget defaultAppName({
  Color color = Colors.white,
  double size = 42
}) =>
     Text(
      'Fruit Market',
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: color,
      ),
    );
