import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';

class ServiceDetailsTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const ServiceDetailsTextField({
    super.key,
    required this.media,
    required this.hintText,
    required this.controller,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins-Regular'),
          fillColor: textFieldFillColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: media.width * 0.03,
            vertical: media.height * 0.015,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: colorPrimary),
          ),
        ));
  }
}
