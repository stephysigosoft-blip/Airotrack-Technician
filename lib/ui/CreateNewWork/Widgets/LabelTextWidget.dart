import 'package:flutter/material.dart';

import '../../utils/Widgets/BoldTextPoppins.dart';

class LabelTextWidget extends StatelessWidget {
  final String label;

  const LabelTextWidget({
    super.key,required this.label
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        BoldTextPoppins(
            text: label,
            color: Colors.black,
            fontSize: 15),
        const Text("*", style: TextStyle(color: Colors.red, fontSize: 15)),
      ],
    );
  }
}