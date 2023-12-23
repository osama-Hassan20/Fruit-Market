import 'package:flutter/material.dart';

import 'widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
