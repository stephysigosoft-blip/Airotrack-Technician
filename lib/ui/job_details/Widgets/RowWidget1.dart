import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../utils/Widgets/BoldTextPoppins.dart';

class RowWidget1 extends StatelessWidget {
  final String name;
  final String amount;

  const RowWidget1({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoldTextPoppins(
          text: name.toString(),
          color: Colors.black,
          fontSize: 18,
        ),
        BoldTextPoppins(
          text: "₹${double.tryParse(amount)?.toStringAsFixed(0) ?? ""}",
          color: lightGreen,
          fontSize: 18,
        ),
      ],
    );
  }
}
