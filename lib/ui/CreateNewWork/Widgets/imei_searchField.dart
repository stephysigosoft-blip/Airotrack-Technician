import 'package:airotrackgit/Model/imei_model.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';

class ImeiSearchField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Size media;
  final List<IMEIModel> items;
  final void Function(IMEIModel?) onChanged;

  const ImeiSearchField({
    super.key,
    required this.media,
    required this.hintText,
    required this.controller,
    required this.items,
    required this.onChanged,
  });

  @override
  State<ImeiSearchField> createState() => _ImeiSearchFieldState();
}

class _ImeiSearchFieldState extends State<ImeiSearchField> {
  bool showSuggestions = false;
  IMEIModel? selectedImei;

  List<IMEIModel> get filteredItems {
    if (widget.controller.text.isEmpty) {
      return [];
    }

    List<IMEIModel> items = widget.items.where((item) {
      final imei = item.imei?.toLowerCase() ?? '';
      final vehicleNo = item.vehicleNo?.toLowerCase() ?? '';
      final search = widget.controller.text.toLowerCase();
      return imei.contains(search) || vehicleNo.contains(search);
    }).toList();

    // Remove duplicates based on imei
    final seen = <String>{};
    return items.where((item) {
      final imei = item.imei ?? '';
      if (seen.contains(imei)) {
        return false;
      }
      seen.add(imei);
      return true;
    }).toList();
  }

  void onImeiSelected(IMEIModel imei) {
    setState(() {
      selectedImei = imei;
      widget.controller.text = '${imei.vehicleNo ?? ''} - ${imei.imei ?? ''}';
      showSuggestions = false;
    });
    widget.onChanged(imei);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins-Regular',
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.media.width * 0.03,
              vertical: widget.media.height * 0.015,
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
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.controller.text.isNotEmpty && selectedImei != null)
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.black),
                    onPressed: () {
                      widget.controller.clear();
                      setState(() {
                        selectedImei = null;
                        showSuggestions = false;
                      });
                      widget.onChanged(null);
                    },
                  ),
                const Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              showSuggestions = true;
              if (selectedImei != null &&
                  widget.controller.text.contains(' - ')) {
                widget.controller.text = selectedImei?.imei ?? '';
              }
            });
          },
          onChanged: (value) {
            setState(() {
              showSuggestions = true;
              selectedImei = null;
              widget.onChanged(null);
            });
          },
        ),
        if (showSuggestions && filteredItems.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            constraints: BoxConstraints(
              maxHeight: widget.media.height * 0.25,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length > 10 ? 10 : filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return InkWell(
                  onTap: () => onImeiSelected(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: NormalTextPoppins(
                      text: '${item.vehicleNo ?? ''} - ${item.imei ?? ''}',
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
