import 'package:flutter/material.dart';

import 'BoldTextPoppins.dart';

class YesButtonWidget extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onTap;

  const YesButtonWidget(
      {super.key,
      required this.media,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      this.onTap});

  final Size media;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: media.height * 0.06,
        width: media.width * 0.32,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: BoldTextPoppins(text: text, color: textColor, fontSize: 14),
      ),
    );
  }
}
