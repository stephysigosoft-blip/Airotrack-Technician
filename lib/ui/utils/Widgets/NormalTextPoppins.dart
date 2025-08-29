import 'package:flutter/material.dart';

class NormalTextPoppins extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const NormalTextPoppins(
      {super.key,
        required this.text,
        required this.color,
        required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize, fontFamily: 'Poppins-Regular'),
    );
  }
}