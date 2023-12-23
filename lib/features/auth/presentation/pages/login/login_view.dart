import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
