import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_buttons.dart';


class customAppBar extends StatelessWidget {
   customAppBar({Key? key,required this.function}) : super(key: key);
  VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        defaultTextButton(
            function:(){
              function;
            },
            text: 'skip'),
      ],
    );
  }
}






//
// Widget customAppBar({
//   required VoidCallback? function,
// }) =>
//     Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         defaultTextButton(
//             function:(){
//               function;
//             },
//             text: 'skip'),
//       ],
//     );
