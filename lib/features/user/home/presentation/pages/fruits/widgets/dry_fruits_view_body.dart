import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_sub_category_product_section.dart';

class FruitsViewBody extends StatelessWidget {
  const FruitsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSubCategoryProductSection(
                subCategoryTitle: 'Organic Fruits',
                off: 20,
                subTitleType: 'Pick up from organic farms',
                category: 'Fruits',
            ),
            CustomSubCategoryProductSection(
                subCategoryTitle: 'Mixed Fruit Pack',
                off: 10,
                subTitleType: 'Fruit mix fresh pack',
                category: 'Fruits',
            ),
            CustomSubCategoryProductSection(
              subCategoryTitle: 'Melons',
              off: 5,
              subTitleType: 'Fresh Melons Fruits',
              category: 'Fruits',
            ),

          ],
        ),
      ),
    );
  }
}
