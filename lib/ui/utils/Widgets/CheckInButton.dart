import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import 'BoldTextPoppins.dart';

class CheckInButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CheckInButton({
    super.key,
    required this.media,required this.buttonText,this.onTap,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding:
          EdgeInsets.symmetric(vertical: media.height * 0.015),
          decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: BoldTextPoppins(
            text: buttonText,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}