import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_buttons.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_cached_network_image.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/product_details_title.dart';
import 'package:fruit_market_ecommerce/features/user/product_details/presentation/pages/product_details/widgets/productdetails_image.dart';
import 'package:fruit_market_ecommerce/features/user/sheckout/presentation/manager/checkout%20_cubit/state.dart';
import 'package:get/get.dart';

import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_show_rating.dart';
import '../../../../../admin/domain/models/pruduct_model.dart';
import '../../manager/checkout _cubit/cubit.dart';
import 'custom_list_steps.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCheckOutCubit, UserCheckOutStates>(
      builder: (context, state) {
        var cubit = UserCheckOutCubit.get(context);
        return Stepper(
          type: StepperType.vertical,
          steps: getSteps(cubit),
          currentStep: cubit.currentStep,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  defaultButton(
                    function: () {
                      cubit.currentStep == 0
                          ? navigator?.pop()
                          : cubit.changeCurrentStep(cubit.currentStep - 1);
                    },
                    text: 'BACK',
                    color: Colors.grey,
                    height: 40.0,
                  ),
                  defaultButton(
                    function: () {
                      print(UserCheckOutCubit.get(context).addressController.text);
                      final isLastStep =
                          cubit.currentStep == getSteps(cubit).length - 1;
                      if (isLastStep) {
                        print('complete');
                      } else {
                        cubit.changeCurrentStep(cubit.currentStep + 1);
                      }
                    },
                    text: 'NEXT',
                    height: 40.0,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


}
