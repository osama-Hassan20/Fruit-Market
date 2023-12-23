import 'package:flutter/material.dart';
import 'custom_g_nav.dart';

class UserLayoutViewBottomNavigationBar extends StatelessWidget {
  const UserLayoutViewBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: const SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: CustomGNav()),
      ),
    );
  }
}
