import 'package:flutter/material.dart';

import '../../utils/Widgets/BoldTextPoppins.dart';

class RowWidget3 extends StatelessWidget {
  final String text1;
  final String text2;

  const RowWidget3({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoldTextPoppins(text: text1, color: Colors.black, fontSize: 16),
        BoldTextPoppins(text: text2, color: Colors.black, fontSize: 16),
      ],
    );
  }
}