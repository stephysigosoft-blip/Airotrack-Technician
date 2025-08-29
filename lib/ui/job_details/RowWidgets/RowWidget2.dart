import 'package:flutter/material.dart';

import '../../utils/Widgets/NormalTextPoppins.dart';

class RowWidget2 extends StatelessWidget {
  final String phoneNumber;
  final Size media;

  const RowWidget2({super.key, required this.phoneNumber, required this.media});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("lib/assets/images/call_icon.png"),
        SizedBox(width: media.height * 0.01),
        NormalTextPoppins(
          text: phoneNumber,
          color: Colors.black,
          fontSize: 15,
        ),
      ],
    );
  }
}