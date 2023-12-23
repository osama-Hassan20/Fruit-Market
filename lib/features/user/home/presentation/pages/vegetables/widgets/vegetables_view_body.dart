import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/custom_sub_category_product_section.dart';

class VegetablesViewBody extends StatelessWidget {
  const VegetablesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Organic Vegetables',
              off: 20,
              subTitleType: 'Pick up from organic farms',
              category: 'Vegetables',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Mixed Vegetables Pack',
              off: 10,
              subTitleType: 'Vegetable mix fresh pack',
              category: 'Vegetables',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Allium Vegetabels',
              off: 20,
              subTitleType: 'Fresh Allium Vegetables',
              category: 'Vegetables',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Root Vegetabels',
              off: 5,
              subTitleType: 'Fresh Root Vegetables',
              category: 'Vegetables',
            ),
          ],
        ),
      ),
    );
  }
}
