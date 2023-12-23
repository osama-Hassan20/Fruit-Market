import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/navigate.dart';
import '../../register/register_view.dart';

class SignInLine extends StatelessWidget {
  const SignInLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an Account ?',
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold
          ),
        ),
        defaultTextButton(
          function: () {
            Navigator.of(context).pop();
            },
          text: 'Sign In',
        ),
      ],
    );
  }
}
