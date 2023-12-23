import 'package:flutter/material.dart';

Widget nameItem({required name})=>
    RichText(
      text: TextSpan(
        text: name,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        children: const <TextSpan>[
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );