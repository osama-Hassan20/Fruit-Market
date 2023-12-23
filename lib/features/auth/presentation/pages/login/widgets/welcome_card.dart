import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/color.dart';
import '../../../../../../core/constants/images.dart';
import '../../../../../../core/utils/size_config.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(
          child: Text(
            'Hi Welcome',
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'IrishGrover',
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
        ),
        SvgPicture.asset(
          AppImages.logoImage,
          height: SizeConfig.defaultSize! * 15,
        ),
      ],
    );
  }
}
