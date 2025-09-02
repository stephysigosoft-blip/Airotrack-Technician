import 'package:flutter/material.dart';
import '../../utils/Widgets/BoldTextPoppins.dart';


class DateText extends StatelessWidget {
  final String date;

  const DateText({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return BoldTextPoppins(
      text: date,
      fontSize: 15,
      color: Colors.black,
    );
  }
}