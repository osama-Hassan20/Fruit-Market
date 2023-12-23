import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../manger/register_cubit/cubit.dart';

class ContinueLine extends StatelessWidget {
  const ContinueLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        line(),
        const Text(
          'or continue with',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16
          ),
        ),
        line(),
      ],
    );
  }

  Widget line()=>Expanded(
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1.5),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    ),
  );
}
