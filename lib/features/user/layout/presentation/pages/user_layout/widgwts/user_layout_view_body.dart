import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/user_layout_cubit/cubit.dart';
import '../../../manager/user_layout_cubit/state.dart';
import 'list_user_view.dart';

class UserLayoutViewBody extends StatelessWidget {
  const UserLayoutViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAppCubit, UserAppStates>(
      builder: (context, state) {
        var cibut = UserAppCubit.get(context);
        return userViews[cibut.currentIndex];
      },
    );
  }
}
