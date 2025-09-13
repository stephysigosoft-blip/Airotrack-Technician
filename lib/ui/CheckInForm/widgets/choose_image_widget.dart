import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:flutter/material.dart';

class ChooseImageWidget extends StatelessWidget {
  final Size media;
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const ChooseImageWidget(
      {super.key,
      required this.icon,
      required this.media,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: greyFillColor,
            borderRadius: BorderRadius.circular(6),
          ),
          height: media.height * 0.13,
          width: media.width * 0.28,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Icon(icon),
            ),
          ),
        ),
        const SizedBox(height: 10),
        BoldTextPoppins(
          text: text,
          color: Colors.black,
          fontSize: 14,
        ),
      ],
    );
  }
}