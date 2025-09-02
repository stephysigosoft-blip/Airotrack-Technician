import 'package:flutter/material.dart';
import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';

class DeviceIdTextField extends StatelessWidget {
  final Size media;

  const DeviceIdTextField({
    super.key,required this.media
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: Strings.enterDeviceId,
        hintStyle: const TextStyle(color:greyText),
        filled: true,
        fillColor: greybg,
        contentPadding:
        EdgeInsets.symmetric(
          horizontal: media.width * 0.03,
          vertical: media.height * 0.02,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color:greyline,width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: colorPrimary, width: 1.5),
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: colorPrimary, // blue
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}