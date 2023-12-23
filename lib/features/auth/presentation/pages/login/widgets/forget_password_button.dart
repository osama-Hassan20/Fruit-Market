import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_buttons.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        defaultTextButton(
          textColor: Colors.grey.withOpacity(0.8),
          function: () {},
          text: 'I’ve forgotten my password',
        ),
      ],
    );
  }
}
