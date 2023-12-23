import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';

class SelectedCategory extends StatefulWidget {
  const SelectedCategory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectedCategoryState createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {


  List<String> countries = [
    'Vegetables',
    'Fruits',
    'Dry Fruits',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedCategory,
        onChanged: (newValue) {
          setState(() {
            selectedCategory = newValue;
            selectedCategory = newValue!;
          });
        },
        items: countries.map<DropdownMenuItem<String>>((String value) {
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
