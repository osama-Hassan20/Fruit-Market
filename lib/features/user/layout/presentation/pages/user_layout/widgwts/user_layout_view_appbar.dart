import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/manager/user_layout_cubit/state.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/pages/user_layout/widgwts/counter_item.dart';
import '../../../../../../../core/constants/color.dart';
import '../../../../../../../core/widgets/app_name.dart';
import '../../../manager/user_layout_cubit/cubit.dart';

Widget userLayoutViewAppBar(context) => SliverAppBar(
      backgroundColor: mainColor,
      elevation: 0,
      title: defaultAppName(size: 18),
      actions: [
            BlocBuilder<UserAppCubit , UserAppStates>(
              builder: (context , state){
                return IconButton(
                  onPressed: (){},
                  icon:
                  UserAppCubit.get(context).cartItem > 0?
                  Stack(
                    children: [
                      const Icon(Icons.notifications,size: 28,),
                      counterItem(count: UserAppCubit.get(context).cartItem, spaceH: 0),
                    ],
                  ):const Icon(Icons.notifications,size: 28,),
                );
              },
            )
      ],
    );
