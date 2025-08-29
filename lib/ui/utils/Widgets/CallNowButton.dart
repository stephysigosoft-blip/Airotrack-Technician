import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';

import 'BoldTextPoppins.dart';

class CallNowButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onTap;

  const CallNowButton(
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
        height: media.height * 0.04,
        width: media.width * 0.20,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: NormalTextPoppins(text: text, color: textColor, fontSize: 12),
      ),
    );
  }
}
