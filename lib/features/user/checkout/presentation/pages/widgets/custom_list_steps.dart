import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/user/sheckout/presentation/pages/widgets/summary.dart';

import 'add_address.dart';
import 'delevery_time.dart';

List<Step> getSteps(cubit) => [
  Step(
    isActive: cubit.currentStep >= 0,
    title: const Text('Delivery'),
    content: const DeliveryTime(),
  ),
  Step(
    isActive: cubit.currentStep >= 1,
    title: const Text('Address'),
    content:  AddAddress(),
  ),
  Step(
    isActive: cubit.currentStep >= 2,
    title: const Text('Summer'),
    content: const Summary(),
  ),
];