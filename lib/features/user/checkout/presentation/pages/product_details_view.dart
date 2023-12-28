import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/admin/domain/models/pruduct_model.dart';
import 'package:fruit_market_ecommerce/features/user/sheckout/presentation/pages/widgets/product_details_view_body.dart';

import '../manager/checkout _cubit/cubit.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key, required this.totalPrice,}) : super(key: key);
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>UserCheckOutCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: const CheckOutViewBody(),
      ),
    );
  }
}
