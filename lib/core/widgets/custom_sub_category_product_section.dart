import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/sub_category_title_type.dart';

import 'custom_list_view_sub_category_product.dart';
import 'custom_sub_category_title.dart';

class CustomSubCategoryProductSection extends StatelessWidget {
  const CustomSubCategoryProductSection({Key? key, required this.subCategoryTitle, required this.off, required this.subTitleType, required this.category}) : super(key: key);
final String subCategoryTitle;
final int off;
final String subTitleType;
final String category;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubCategoryTitle(subTitle: subCategoryTitle, off: off),
          const SizedBox(height: 10,),
          SubCategoryTitleType(subTitleType: subTitleType),
          const SizedBox(height: 15,),
          CustomListViewSubCategoryProduct(category:category ,subCategory: subCategoryTitle),
        ],
      ),
    );
  }
}
