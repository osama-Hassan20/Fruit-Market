import 'package:flutter/material.dart';

import '../utils/size_config.dart';

Widget spaceHorizontal({
  required double value,
}) =>
    SizedBox(
      width: SizeConfig.defaultSize! * value,
    );



Widget spaceVertical({
  required double value,
}) =>
    SizedBox(
      height: SizeConfig.defaultSize! * value,
    );