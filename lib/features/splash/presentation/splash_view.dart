import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/splash/presentation/widgets/splash_view_body.dart';

import '../../../core/constants/color.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainColor,
      body: SplashViewBody(),
    );
  }
}
