import 'package:flutter/material.dart';

Widget genderButton(cubit)=>Center(
  child: Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(.15),
      borderRadius: BorderRadius.circular(30),

    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Radio(
              value: "Male",
              groupValue: cubit.genderSelectedValue,
              onChanged: (value) {
                cubit.genderSelected(value);
              },
            ),
            const Text(
              "Male",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
        Row(
          children: [
            Radio(
              value: "Female",
              groupValue: cubit.genderSelectedValue,
              onChanged: (value) {
                cubit.genderSelected(value);
              },
            ),
            const Text(
              "Female",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    ),
  ),
);