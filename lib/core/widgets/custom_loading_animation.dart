import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/color.dart';

class CustomConditionalBuilderFallback extends StatelessWidget {
  const CustomConditionalBuilderFallback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: mainColor,
        size: 50,
      ),
    );
  }
}
