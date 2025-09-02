import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CreateNewWorkDropDown extends StatelessWidget {
  final String hintText;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final Size media;

  const CreateNewWorkDropDown({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.media,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor: textFieldFillColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
        ),
        isExpanded: true,
        hint: NormalTextPoppins(
            text: hintText, color: Colors.black, fontSize: 13),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: NormalTextPoppins(
                text: item, color: Colors.black, fontSize: 13),
          );
        }).toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: media.height * 0.06,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: media.height * 0.05,
        ),
        dropdownStyleData: const DropdownStyleData(
          decoration: BoxDecoration(
            color: greyFillColor,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ));
  }
}
