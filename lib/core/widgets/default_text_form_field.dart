
import 'package:flutter/material.dart';

import '../constants/color.dart';

Widget defaultFormField({
  TextEditingController? controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  bool isPassword = false,
  ValueChanged? onChanged,
  GestureTapCallback? onTap,
  FormFieldValidator<String>? validate,
  String? label,
  String? hintText,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? maxLines,
  // bool underLine = true,
  // required var context,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      maxLines: maxLines ?? 1,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        filled: true,
        labelText: label,
        prefixIcon: prefix != null
            ? Icon(
          prefix,
            color: mainColor,
          ) : null,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
            color: mainColor,
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );


