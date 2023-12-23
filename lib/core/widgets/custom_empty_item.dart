import 'package:flutter/material.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({Key? key, required this.itemName, required this.icon}) : super(key: key);
final String itemName;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Icon(
            icon,
            size: 100,
            color: Colors.grey[300],

          ),
          const SizedBox(height: 20,),
           Text(
            'No $itemName yet',
            style: const TextStyle(
                fontSize: 18
            ),
          ),



        ],
      ),
    );
  }
}
