import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import 'NormalTextPoppins.dart';

class ColorChangingButton extends StatelessWidget {
  final Size media;
  final VoidCallback? onTap;

  const ColorChangingButton(
      {super.key,
      required this.selectedMethod,
      required this.media, this.onTap});

  final String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedMethod == null
            ? null
            : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          disabledBackgroundColor: greyFillColor,
          padding: EdgeInsets.symmetric(vertical: media.height * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: NormalTextPoppins(
          text: selectedMethod == null
              ? Strings.generateCertificate
              : selectedMethod == "Cash"
                  ? "${Strings.collect} ₹1200 ${Strings.inCash}"
                  : selectedMethod == "Online"
                      ? Strings.checkStatus
                      : Strings.next,
          color: selectedMethod == null ? greyText : Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
