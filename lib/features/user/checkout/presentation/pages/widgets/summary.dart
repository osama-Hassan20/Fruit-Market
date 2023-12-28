import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/variables.dart';
import '../../../../account/presentation/pages/account/widgets/custom_profile_item.dart';
import '../../../../shopping/presentation/manager/shopping _cubit/cubit.dart';
import '../../manager/checkout _cubit/cubit.dart';
import '../../manager/checkout _cubit/state.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UserCheckOutCubit,UserCheckOutStates>(
      builder: (context , state){
        return Column(
          children: [
            Row(
              children: [
                Expanded(child: CustomUserAccount(title: 'Name', body: userModel!.name!)),
                Expanded(child: CustomUserAccount(title: 'Phone', body: userModel!.phone!)),
              ],
            ),
            CustomUserAccount(title: 'Address', body: UserCheckOutCubit.get(context).addressController.text),
            CustomUserAccount(title: 'Total Price', body: UserShoppingCubit.get(context).totalPrice.toString()),
          ],
        );
      },
    );
  }
}