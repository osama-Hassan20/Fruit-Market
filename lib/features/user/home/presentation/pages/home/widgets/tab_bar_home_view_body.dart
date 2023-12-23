import 'package:flutter/material.dart';
import 'list_tab_bar.dart';

class CustomTabBarHome extends StatelessWidget {
  const CustomTabBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 90,
        child: TabBar(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 25),
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffCC7D00),
            ),
            tabs: tabBarItem
        ),
      ),
    );
  }
}
