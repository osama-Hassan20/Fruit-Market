import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/core/utils/styles.dart';
import 'package:fruit_market_ecommerce/core/widgets/default_text_form_field.dart';

import '../../../../../../core/constants/variables.dart';
import '../../manager/checkout _cubit/cubit.dart';



class AddAddress extends StatelessWidget {
   AddAddress({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // UserCheckOutCubit.get(context).addressController.text = userModel!.address!;
    return   Form(
      key: UserCheckOutCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.cloud_done,color: mainColor,),
              Expanded(child: Text('Billing address is the same as delivery address',style: Styles.textStyle10,)),
            ],
          ),
          const SizedBox(height: 20,),
          Text('Enter Delivery address',
              style: Styles.textStyle14.copyWith(color: mainColor)
          ),
          const SizedBox(height: 10,),
          // defaultFormField(
          //   controller: UserCheckOutCubit.get(context).addressController,
          //   type: TextInputType.text,
          //   hintText: 'Sharqia Governorate, Zagazig City, Ahmed Orabi Street',
          //   maxLines: 7,
          //   onChanged: (value){
          //     UserCheckOutCubit.get(context).changeAddressController(value);
          //   },
          // ),
          defaultFormField(
            controller: UserCheckOutCubit.get(context).addressController,
            type: TextInputType.text,
            maxLines: 5,
            hintText: 'Sharqia Governorate, Zagazig City, Ahmed Orabi Street',
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Delivery address must not be empty';
              } else {
                return null;
              }
            },
          ),

        ],
      ),
    );
  }
}