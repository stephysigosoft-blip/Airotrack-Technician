import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import 'CreateNewWorkTextField.dart';

class CountryCodeAndMobile extends StatelessWidget {
  const CountryCodeAndMobile({
    super.key,
    required this.media,
    required this.controller,
  });

  final Size media;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: media.width * 0.25,
            child: CountryCodeDropdown(
              selectedCode: "+91",
              media: MediaQuery.of(context).size,
              onChanged: (value) {
                debugPrint("Selected: $value");
              },
            )),
        SizedBox(width: media.width * 0.02),
        Expanded(
          child: CreateNewWorkTextField(
            phoneNumber: true,
              controller: controller,
              hintText: Strings.phoneNumber,
              media: media),
        ),
      ],
    );
  }
}

class CountryCodeDropdown extends StatelessWidget {
  final List<String> countryCodes = ["+91"];
  final String selectedCode;
  final void Function(String?) onChanged;
  final Size media;

  CountryCodeDropdown({
    super.key,
    required this.selectedCode,
    required this.onChanged,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: selectedCode,
      isExpanded: true,
      items: countryCodes
          .map((code) => DropdownMenuItem<String>(
                value: code,
                child: Text(
                  code,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
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
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
      ),
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.symmetric(horizontal: media.width * 0.01),
        height: media.height * 0.058,
      ),
      dropdownStyleData: DropdownStyleData(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
