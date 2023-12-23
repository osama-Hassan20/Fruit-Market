import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/utils/size_config.dart';
import 'package:fruit_market_ecommerce/core/widgets/space_widget.dart';

import '../constants/color.dart';

Widget defaultButton({
  bool isUpperCase = false,
  dynamic width ,
  dynamic height ,
  Color? color ,
  Color? textColor ,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      height: height ?? 60,
      width: width ?? SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color??mainColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );



Widget defaultTextButton({
  required VoidCallback? function,
  required String text,
   Color? textColor,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style:   TextStyle(
          decoration: TextDecoration.underline,
          color: textColor ?? textButtonColor,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    );




Widget defaultButtonWithIcon({
  BorderRadius? borderRadius,
  bool withIcon = true,
  required String text,
   IconData? iconData,
  required VoidCallback? onTap,
  required Color backgroundColor,
   Color? textColor  ,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: withIcon ? 50: 40,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            border: Border.all(
              color:  textButtonColor,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            withIcon ? Icon(
              iconData,
              color: Colors.white,
            ) : const SizedBox(),
            withIcon ?spaceHorizontal(value: 2) : spaceHorizontal(value: 0),
            Text(
              text,
              style:  TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 12,
                color: textColor?? Colors.white ,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );



