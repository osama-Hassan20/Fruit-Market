import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/variables.dart';
import 'package:fruit_market_ecommerce/features/user/sheckout/presentation/manager/checkout%20_cubit/state.dart';

import '../../pages/widgets/delivery_state.dart';

class UserCheckOutCubit extends Cubit<UserCheckOutStates> {
  UserCheckOutCubit() : super(UserCheckOutInitialStates());

  static UserCheckOutCubit get(context) => BlocProvider.of(context);
  var addressController = TextEditingController();
  void changeAddressController(String value) {
    addressController.text = value;
    emit(UserChangeAddressControllerState());
  }

  int currentStep = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeCurrentStep(int index) {

    if(index == 2){
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        print(addressController.text);
        currentStep = index;
      }
    }else{
      currentStep = index;
    }
    emit(UserChangeCurrentStepState());
  }

  DeliveryState deliveryState = DeliveryState.StandardDelivery;
  void changeDeliveryState(DeliveryState value) {
    deliveryState = value;
    emit(UserChangeDeliveryState());
  }
}
