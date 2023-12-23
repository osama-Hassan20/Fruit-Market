import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/account/presentation/manager/account%20_cubit/cubit.dart';
import 'widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>UserAccountCubit()..getUserData(),
      child: const Scaffold(
        // drawer: ,
        body: AccountViewBody(),
      ),
    );
  }
}
