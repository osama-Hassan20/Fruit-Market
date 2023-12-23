import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/navigate.dart';
import '../../register/register_view.dart';

class SignUpLine extends StatelessWidget {
  const SignUpLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don’t have an account ?',
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold
          ),
        ),
        defaultTextButton(
          function: () {
            navigateTo(context,  const RegisterView());
          },
          text: 'Sign Up',
        ),
      ],
    );
  }
}
