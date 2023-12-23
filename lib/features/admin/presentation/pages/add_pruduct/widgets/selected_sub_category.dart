import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';

class SelectedSubCategory extends StatefulWidget {
  const SelectedSubCategory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectedSubCategoryState createState() => _SelectedSubCategoryState();
}

class _SelectedSubCategoryState extends State<SelectedSubCategory> {


  List<String> subCountries =[];
  List<String> countries = [
    'Vegetables',
    'Fruits',
    'Dry Fruits',
  ];

  @override
  Widget build(BuildContext context) {
    if(selectedCategory== 'Vegetables'){
      setState(() {
        subCountries=[
          'Organic Vegetables',
          'Mixed Vegetables Pack',
          'Allium Vegetables',
          'Root Vegetables',
        ];
      });

    }else if(selectedCategory == 'Fruits'){
      setState(() {
        subCountries=[
          'Organic Fruits',
          'Mixed Fruit Pack',
          'Stone Fruits',
          'Melons',
        ];
      });

    }else {
      setState(() {
        subCountries=[
          'Indehiscent Dry Fruits',
          'Mixed Dry Fruits Pack',
          'Dehiscent Dry Fruits',
          'Kashmiri Dry Fruits',
        ];
      });

    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedSubCategory,
        onChanged: (newValue) {
          setState(() {
            selectedSubCategory = newValue;
            selectedSubCategory = newValue!;
          });
        },
        items: subCountries.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
