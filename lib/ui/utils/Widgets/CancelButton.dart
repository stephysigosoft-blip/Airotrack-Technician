import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import 'BoldTextPoppins.dart';

class CancelButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CancelButton(
      {super.key, required this.media, required this.buttonText, this.onTap});

  final Size media;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: media.height * 0.015),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(6),
              color: paleRed),
          alignment: Alignment.center,
          child: BoldTextPoppins(
            text: buttonText,
            color: Colors.red,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
