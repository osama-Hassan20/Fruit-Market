import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/build_alert_dialog.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_buttons.dart';

class ColorSelectionDropdown extends StatefulWidget {
  const ColorSelectionDropdown({super.key});

  @override
  _ColorSelectionDropdownState createState() => _ColorSelectionDropdownState();
}

class _ColorSelectionDropdownState extends State<ColorSelectionDropdown> {
  List<String> selectedNutrition = [];
  List<String> allNutrition = [
    'Fiber',
    'Potassium',
    'Iron',
    'Magnesium',
    'VitaminC',
    'VitaminK',
    'Zinc',
    'Phosphorous',
    'Fat',
    'Selenium',
    'VitaminB9',
    'VitaminA',
    'Protein',
    'Folates',
    'Niacin',
    'VitaminE',
    'Calcium',
    'Carbohydrates',

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultButton(
          height: 40.0,
          function: () {
            buildAlertDialog(
                context: context,
                title: 'Choose Nutrition',
                contentWidget: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allNutrition.length,
                    itemBuilder: (context, index) {
                      final color = allNutrition[index];
                      return NutritionCheckboxListTile(
                        color: color,
                        selectedColors: selectedNutrition,
                        onChanged: (selected) {
                          setState(() {
                            if (selected) {
                              selectedNutrition.add(color);
                            } else {
                              selectedNutrition.remove(color);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                textButtonRight: 'Save',
                textButtonLeft: 'Clear',
                onPressedRight: (){nutritionProduct =
                    selectedNutrition.join(" ");
                Navigator.pop(context);},
                onPressedLeft: (){
                  setState(() {
                    selectedNutrition.clear();
                    Navigator.pop(context);
                  });
                },);
          },
          text: 'add',
          isUpperCase: true,
          textColor: Colors.black,
          color: Colors.grey,
          width: SizeConfig.defaultSize! * 15,
        ),
        const SizedBox(height: 5),
        Text(
          '$nutritionProduct',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class NutritionCheckboxListTile extends StatefulWidget {
  final String color;
  final List<String> selectedColors;
  final ValueChanged<bool> onChanged;

  const NutritionCheckboxListTile({
    Key? key,
    required this.color,
    required this.selectedColors,
    required this.onChanged,
  }) : super(key: key);

  @override
  _NutritionCheckboxListTileState createState() => _NutritionCheckboxListTileState();
}

class _NutritionCheckboxListTileState extends State<NutritionCheckboxListTile> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.selectedColors.contains(widget.color);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.green,
      title: Text(widget.color),
      value: isChecked,
      onChanged: (selected) {
        setState(() {
          isChecked = selected!;
        });
        widget.onChanged(selected!);
      },
    );
  }
}