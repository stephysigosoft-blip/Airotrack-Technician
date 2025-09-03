import 'package:flutter/material.dart';
import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import '../../utils/Widgets/BoldTextPoppins.dart';

class OpenScannerButton extends StatelessWidget {
  final Size media;
  final Color buttonColor;
  final VoidCallback? onPressed;

  const OpenScannerButton({
    super.key,
    required this.media,
    this.onPressed,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: EdgeInsets.symmetric(vertical: media.width * 0.035),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: onPressed,
          icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
          label: const BoldTextPoppins(
              text: Strings.openScanner, color: Colors.white, fontSize: 16)),
    );
  }
}
