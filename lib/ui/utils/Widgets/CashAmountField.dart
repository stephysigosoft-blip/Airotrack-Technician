import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';

class CashAmountField extends StatelessWidget {
  final TextEditingController controller;
  final Size media;
  final Function(String)? onChanged;

  const CashAmountField({
    super.key,
    required this.controller,
    required this.media,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
              text: Strings.cashAmount,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins-Regular',
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: " *",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ),
        SizedBox(height: media.height * 0.007),
        TextFormField(
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: media.width * 0.03,
                vertical: media.height * 0.02,
              ),
              child: const Text(
                "₹",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            filled: true,
            fillColor: greyFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: media.width * 0.03,
              vertical: media.height * 0.02,
            ),
          ),
        ),
      ],
    );
  }
}