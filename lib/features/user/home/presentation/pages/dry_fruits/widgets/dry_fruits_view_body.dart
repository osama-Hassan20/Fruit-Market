import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/custom_sub_category_product_section.dart';

class DryFruitsViewBody extends StatelessWidget {
  const DryFruitsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Indehiscent Dry Fruits',
              off: 20,
              subTitleType: 'Pick up from organic farms',
              category: 'Dry Fruits',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Mixed Dry Fruits Pack',
              off: 10,
              subTitleType: 'Dry Fruits mix fresh pack',
              category: 'Dry Fruits',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Dehiscent Dry Fruits',
              off: 15,
              subTitleType: 'Fresh Dehiscent Dry Fruits',
              category: 'Dry Fruits',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Kashmiri Dry Fruits',
              off: 5,
              subTitleType: 'Fresh Kashmiri Dry Fruits',
              category: 'Dry Fruits',
            ),
          ],
        ),
      ),
    );
  }
}
