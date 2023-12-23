import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/color.dart';
import 'boarding_list.dart';

class CustomIndicator extends StatelessWidget {
   CustomIndicator({Key? key, required this.boardController}) : super(key: key);
  var boardController = PageController();
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: boardController,
      count: boarding.length,
      effect:     const ExpandingDotsEffect(
          activeDotColor: mainColor,
          dotColor: Colors.grey,
          dotHeight: 10,
          expansionFactor: 3,
          dotWidth: 20,
          spacing: 6

      ),
    );
  }
}
