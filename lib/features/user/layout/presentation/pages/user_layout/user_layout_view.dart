import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/manager/user_layout_cubit/state.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/pages/user_layout/widgwts/user_layout_view_appbar.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/pages/user_layout/widgwts/user_layout_view_body.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/pages/user_layout/widgwts/user_layout_view_bottom_navigation_bar.dart';

import '../../manager/user_layout_cubit/cubit.dart';

class UserLayoutView extends StatelessWidget {
  const UserLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAppCubit, UserAppStates>(
      builder: (context, state) {
        var cubit = UserAppCubit.get(context);
        return Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                cubit.showBottomNav(notification.metrics.pixels <= 10);
              }
              return false;
            },
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                userLayoutViewAppBar(context),
              ],
              body: UserLayoutViewBody(),
            ),
          ),
          bottomNavigationBar: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: cubit.isScrolledToTop ? kBottomNavigationBarHeight : 30,
            child: const UserLayoutViewBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
