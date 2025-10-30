import 'package:airotrackgit/Model/company_title_model.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CompanyNameDropdown extends StatelessWidget {
  final String hintText;
  final CompanyData? value;
  final List<CompanyData> items;
  final void Function(CompanyData?) onChanged;
  final Size media;

  const CompanyNameDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.media,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<CompanyData>(
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
        value: value != null && items.any((item) => item.id == value?.id)
            ? value
            : null,
        items: items.map((item) {
          return DropdownMenuItem<CompanyData>(
            value: item,
            child: NormalTextPoppins(
                text: item.title ?? '', color: Colors.black, fontSize: 13),
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
