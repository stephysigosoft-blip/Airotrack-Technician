import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'BoldTextPoppins.dart';

class NavigateButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onTap;

  const NavigateButton(
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
        width: media.width * 0.25,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.navigation, color: textColor, size: 16),
              SizedBox(width: media.width * 0.01),
              NormalTextPoppins(text: text, color: textColor, fontSize: 12),
            ],
          ),
        ),
      ),
    );
  }
}
