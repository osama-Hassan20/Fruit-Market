import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:fruit_market_ecommerce/features/user/account_setting/presentation/view/widgets/account_setting_view_body.dart';

import '../../../../../core/widgets/custom_arrow_back.dart';

class AccountSettingView extends StatelessWidget {
  const AccountSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Account Setting'),
        leading: const CustomArrowBack(),
      ),
      body: const AccountSettingViewBody(),
    );
  }
}
