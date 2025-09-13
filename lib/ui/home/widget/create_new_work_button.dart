import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';

class CreateNewWorkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Size media;

  const CreateNewWorkButton(
      {super.key, required this.onPressed, required this.media});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: media.height * 0.06,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          onPressed: onPressed,
          child: const Text(
            "Create New Work",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Poppins-Bold',
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
