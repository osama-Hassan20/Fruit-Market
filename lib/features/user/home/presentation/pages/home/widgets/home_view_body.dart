import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/user/home/presentation/pages/home/widgets/tab_bar_home_view_body.dart';

import 'list_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      animationDuration: const Duration(milliseconds: 500),
      child:
      Column(
        children: [
          const CustomTabBarHome(),

          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: homeViews,
            ),
          ),
        ],
      ),
    );
  }
}
