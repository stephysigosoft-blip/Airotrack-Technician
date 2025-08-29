import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import 'BoldTextPoppins.dart';

class PaymentStatusWidget extends StatelessWidget {
  final String message;
  final double amount;
  final Size media;

  const PaymentStatusWidget(
      {super.key,
        required this.message,
        required this.amount,
        required this.media});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(media.height * 0.016),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: colorPrimaryWithOpacity25,
          ),
          child: Container(
            padding: EdgeInsets.all(media.height * 0.016),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: colorPrimaryWithOpacity40
            ),
            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset("lib/assets/images/tick_icon.png")),
          ),
        ),
        SizedBox(height: media.height * 0.02),
        BoldTextPoppins(
          text: message,
          color: Colors.black,
          fontSize: 20,
        ),
        SizedBox(height: media.height * 0.005),
        BoldTextPoppins(
          text:"${Strings.forText} ₹${amount.toStringAsFixed(0)}" ,
          color: Colors.black,
          fontSize: 20,
        ),
      ],
    );
  }
}