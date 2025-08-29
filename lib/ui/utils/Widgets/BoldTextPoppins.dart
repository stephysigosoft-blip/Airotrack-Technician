import 'package:flutter/material.dart';

class BoldTextPoppins extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const BoldTextPoppins({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Poppins-Bold',
        fontWeight: FontWeight.bold
      ),
    );
  }
}
