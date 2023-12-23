import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/space_widget.dart';

import '../../../../../../core/widgets/custom_buttons.dart';
import 'complete_information_item.dart';

class CompleteInformationBody extends StatelessWidget {
  const CompleteInformationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          spaceVertical(value: 10),
          const CompleteInfoItem(
            text: 'Enter your name',
          ),
          spaceVertical(value:2),
          const CompleteInfoItem(
            text: 'Enter your phone number',
          ),
          spaceVertical(value:2),
          const CompleteInfoItem(
            maxLines: 5,
            text: 'Enter your address',
          ),
          spaceVertical(value:5),
          defaultButton(
            text: 'Login',
            function: (){}
          )
        ],
      ),
    );
  }
}