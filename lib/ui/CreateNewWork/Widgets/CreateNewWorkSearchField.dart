import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';

class CreateNewWorkSearchField extends StatelessWidget {
  final String hintText;

  const CreateNewWorkSearchField({
    super.key,
    required this.media,required this.hintText
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins-Regular'),
            fillColor: Colors.white,
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
            suffixIcon: const Icon(Icons.search, color: Colors.black)));
  }
}