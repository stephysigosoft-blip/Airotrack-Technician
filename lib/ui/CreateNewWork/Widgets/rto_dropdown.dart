import 'package:airotrackgit/Model/Rto_model.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';

class RtoSearchField extends StatefulWidget {
  final String hintText;
  final RTOData? value;
  final List<RTOData> items;
  final void Function(RTOData?) onChanged;
  final Size media;

  const RtoSearchField({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.media,
    this.value,
  });

  @override
  State<RtoSearchField> createState() => _RtoSearchFieldState();
}

class _RtoSearchFieldState extends State<RtoSearchField> {
  late TextEditingController searchController;
  bool showSuggestions = false;
  RTOData? selectedRto;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    selectedRto = widget.value;
    searchController.text = widget.value != null
        ? '${widget.value!.rtoCode ?? ''} - ${widget.value!.rtoName ?? ''}'
        : '';
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<RTOData> get filteredItems {
    if (searchController.text.isEmpty) {
      return [];
    }

    List<RTOData> items = widget.items.where((item) {
      final code = item.rtoCode?.toLowerCase() ?? '';
      final name = item.rtoName?.toLowerCase() ?? '';
      final search = searchController.text.toLowerCase();
      return code.contains(search) || name.contains(search);
    }).toList();

    final seen = <String>{};
    return items.where((item) {
      final code = item.rtoCode ?? '';
      if (seen.contains(code)) {
        return false;
      }
      seen.add(code);
      return true;
    }).toList();
  }

  void onRtoSelected(RTOData rto) {
    setState(() {
      selectedRto = rto;
      searchController.text = '${rto.rtoCode ?? ''} - ${rto.rtoName ?? ''}';
      showSuggestions = false;
    });
    widget.onChanged(rto);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Poppins-Regular',
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (searchController.text.isNotEmpty && selectedRto != null)
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        selectedRto = null;
                        showSuggestions = false;
                      });
                      widget.onChanged(null);
                    },
                  ),
                const Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
          style: const TextStyle(fontSize: 13),
          onTap: () {
            setState(() {
              showSuggestions = true;
              if (selectedRto != null &&
                  searchController.text.contains(' - ')) {
                searchController.text = selectedRto?.rtoCode ?? '';
              }
            });
          },
          onChanged: (value) {
            setState(() {
              showSuggestions = true;
              selectedRto = null;
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
              color: greyFillColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length > 10 ? 10 : filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return InkWell(
                  onTap: () => onRtoSelected(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: NormalTextPoppins(
                      text: '${item.rtoCode ?? ''} - ${item.rtoName ?? ''}',
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
