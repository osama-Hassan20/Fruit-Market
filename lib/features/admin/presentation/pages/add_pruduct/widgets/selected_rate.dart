import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';

class SelectedRate extends StatefulWidget {
  const SelectedRate({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectedRateState createState() => _SelectedRateState();
}

class _SelectedRateState extends State<SelectedRate> {


  List<int> rates = [
    1,
    2,
    3,
    4,
    5,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        value: selectedRate,
        onChanged: (newValue) {
          setState(() {
            selectedRate = newValue;
            selectedRate = newValue;
          });
        },
        items: rates.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('$value'),
            ),
          );
        }).toList(),
      ),
    );
  }
}