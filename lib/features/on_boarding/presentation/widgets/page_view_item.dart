import 'package:flutter/material.dart';

import '../../../../core/widgets/space_widget.dart';
import '../../domain/models/on_bording_model.dart';

Widget buildPageViewItem(BoardingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children:  [
    Expanded(
        child: Image.asset(
          model.image,
          fit: BoxFit.fill,
          // width: double.infinity,
        )
    ),
    spaceVertical(value: 5),
    Text(
      model.title,
      style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
    spaceVertical(value: 2),
    Text(
      model.body,
      style: const TextStyle(
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    ),
  ],
);
