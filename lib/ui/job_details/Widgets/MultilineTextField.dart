import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';

class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField({
    super.key,
    required this.reasonController,
  });

  final TextEditingController reasonController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: reasonController,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: "Type here...",
        hintStyle: const TextStyle(
            color: greyText,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins-Regular'),
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: grey),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
