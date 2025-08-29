import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const RichTextWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: text1,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins-Bold')),
          TextSpan(
            text: text2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins-Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
