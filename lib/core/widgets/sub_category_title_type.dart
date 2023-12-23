import 'package:flutter/material.dart';

class SubCategoryTitleType extends StatelessWidget {
  const SubCategoryTitleType({Key? key, required this.subTitleType}) : super(key: key);
final String subTitleType;
  @override
  Widget build(BuildContext context) {
    return  Text(
      subTitleType,
      style: const TextStyle(
        fontSize: 12,
      ),
      textAlign: TextAlign.left,
    );
  }
}
