import 'package:flutter/material.dart';

class SubCategoryTitle extends StatelessWidget {
  const SubCategoryTitle({Key? key, required this.subTitle, required this.off}) : super(key: key);
  final String subTitle;
  final int off;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(subTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(width: 20,),
        Text('($off% Off)',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xff4CA300),
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
