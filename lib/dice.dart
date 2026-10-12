import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;
  const Dice({super.key, required this.value});
  IconData getIcon() {
    switch (value) {
      case 1:
        return Icons.looks_one;
      case 2:
        return Icons.looks_two;
      case 3:
        return Icons.looks_3;
      case 4:
        return Icons.looks_4;
      case 5:
        return Icons.looks_5;
      default:
        return Icons.looks_6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(getIcon(), size: 80, color: Colors.lightBlue);
  }
}
