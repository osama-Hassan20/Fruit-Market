import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../../../core/constants/color.dart';
import '../../../manager/user_layout_cubit/cubit.dart';
import '../../../manager/user_layout_cubit/state.dart';
import 'list_g_button.dart';

class CustomGNav extends StatelessWidget {
  const CustomGNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAppCubit, UserAppStates>(builder: (context, state) {
      var cibut = UserAppCubit.get(context);
      return GNav(
        rippleColor: textButtonColor.withOpacity(0.5),
        hoverColor: textButtonColor.withOpacity(0.5),
        gap: 6,
        activeColor: mainColor,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: textButtonColor.withOpacity(0.15),
        color: Colors.black,
        tabs: gButtonItem(context),
        selectedIndex: cibut.currentIndex,
        onTabChange: (index) {
          cibut.changeBottomNav(index);
        },
      );
    });
  }
}
