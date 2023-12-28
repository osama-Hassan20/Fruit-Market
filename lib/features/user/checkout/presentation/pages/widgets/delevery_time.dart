import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/utils/styles.dart';
import 'package:fruit_market_ecommerce/features/user/sheckout/presentation/manager/checkout%20_cubit/state.dart';

import '../../manager/checkout _cubit/cubit.dart';
import 'delivery_state.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<UserCheckOutCubit , UserCheckOutStates>(
      builder: (context , state){
        var cubit =UserCheckOutCubit.get(context);
        return Column(
          children: [
            RadioListTile<DeliveryState>(
              value: DeliveryState.StandardDelivery,
              groupValue: cubit.deliveryState,
              onChanged: (DeliveryState? value){
                cubit.changeDeliveryState(value!);
              },
              title: const Text('Standard Delivery',style: Styles.textStyle18,),
              subtitle: const Text('Order will be delivered between 3 - 5 business days',style: Styles.textStyle12,),
            ),
            RadioListTile<DeliveryState>(
              value: DeliveryState.NextDayDelivery,
              groupValue: cubit.deliveryState,
              onChanged: (DeliveryState? value){
                cubit.changeDeliveryState(value!);
              },
              title: const Text('Next Day Delivery',style: Styles.textStyle18,),
              subtitle: const Text('Place your order before 6pm and your items will be delivered the next day',style: Styles.textStyle12,),
            ),
            RadioListTile<DeliveryState>(
              value: DeliveryState.NominatedDelivery,
              groupValue: cubit.deliveryState,
              onChanged: (DeliveryState? value){
                cubit.changeDeliveryState(value!);
              },
              title: const Text('Nominated Delivery',style: Styles.textStyle18,),
              subtitle: const Text('Pick a particular date from the calendar and order will be delivered on selected date',style: Styles.textStyle12,),
            ),

          ],
        );
      },

    );
  }
}