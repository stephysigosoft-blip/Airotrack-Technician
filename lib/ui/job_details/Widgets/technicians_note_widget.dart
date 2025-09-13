import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/material.dart';

class TechniciansNoteWidget extends StatelessWidget {
  const TechniciansNoteWidget({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: media.height * 0.30,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Type here...",
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: colorPrimary),
          ),
          filled: true,
          fillColor: greyFillColor,
        ),
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}
