import 'package:flutter/material.dart';

Future buildAlertDialog({
  required BuildContext context,
  required String title,
  required Widget contentWidget,
  required String textButtonRight,
  required String textButtonLeft,
  required VoidCallback? onPressedRight,
  required VoidCallback? onPressedLeft,
})=>showDialog(
  context: context,
  builder: (context) =>
      AlertDialog(
        title:  Text(title),
          content:contentWidget,
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: onPressedLeft,
                  child:  Text(textButtonLeft),
                ),
                const Spacer(),
                TextButton(
                  onPressed: onPressedRight,
                  child:  Text(textButtonRight),
                ),
              ],
            ),
        ],
      ),
);