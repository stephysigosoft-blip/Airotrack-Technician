import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import 'BoldTextPoppins.dart';

class PaymentQRWidget extends StatelessWidget {
  final double amount;
  final String qrImage;

  const PaymentQRWidget({
    super.key,
    required this.amount,
    required this.qrImage,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: media.height * 0.02),
        const BoldTextPoppins(
          text: Strings.pleaseScanToPay,
          color: Colors.black,
          fontSize: 18,
        ),
        SizedBox(height: media.height * 0.005),
        BoldTextPoppins(
          text: "₹${amount.toStringAsFixed(2)}",
          color: lightGreen,
          fontSize: 23,
        ),
        SizedBox(height: media.height * 0.02),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            qrImage,
            height: media.height * 0.25,
            width: media.height * 0.25,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}