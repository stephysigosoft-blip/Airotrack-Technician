import 'package:airotrackgit/Model/speed_governor_model.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';

class SpeedGovernorSearchField extends StatefulWidget {
  final String hintText;
  final SpeedGovernor? value;
  final List<SpeedGovernor> items;
  final void Function(SpeedGovernor?) onChanged;
  final Size media;

  const SpeedGovernorSearchField({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.media,
    this.value,
  });

  @override
  State<SpeedGovernorSearchField> createState() =>
      _SpeedGovernorSearchFieldState();
}

class _SpeedGovernorSearchFieldState extends State<SpeedGovernorSearchField> {
  late TextEditingController searchController;
  bool showSuggestions = false;
  SpeedGovernor? selectedSpeedGovernor;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    selectedSpeedGovernor = widget.value;
    if (widget.value != null) {
      searchController.text = _getDisplayText(widget.value!);
    }
  }

  @override
  void didUpdateWidget(SpeedGovernorSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      selectedSpeedGovernor = widget.value;
      if (widget.value != null) {
        searchController.text = _getDisplayText(widget.value!);
      } else {
        searchController.clear();
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String _getDisplayText(SpeedGovernor sg) {
    final vehicleModel = sg.vehicleModel ?? '';
    final sgModel = sg.sgModel ?? '';
    return '$vehicleModel - $sgModel';
  }

  List<SpeedGovernor> get filteredItems {
    if (searchController.text.isEmpty) {
      return [];
    }

    final search = searchController.text.toLowerCase();
    return widget.items.where((item) {
      final vehicleModel = item.vehicleModel?.toLowerCase() ?? '';
      final sgModel = item.sgModel?.toLowerCase() ?? '';
      final vehicleMake = item.vehicleMake?.toLowerCase() ?? '';
      return vehicleModel.contains(search) ||
          sgModel.contains(search) ||
          vehicleMake.contains(search);
    }).toList();
  }

  void onSpeedGovernorSelected(SpeedGovernor sg) {
    setState(() {
      selectedSpeedGovernor = sg;
      searchController.text = _getDisplayText(sg);
      showSuggestions = false;
    });
    widget.onChanged(sg);
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
                if (searchController.text.isNotEmpty &&
                    selectedSpeedGovernor != null)
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        searchController.clear();
                        selectedSpeedGovernor = null;
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
              if (selectedSpeedGovernor != null &&
                  searchController.text.contains(' - ')) {
                searchController.text =
                    selectedSpeedGovernor?.vehicleModel ?? '';
              }
            });
          },
          onChanged: (value) {
            setState(() {
              showSuggestions = true;
              selectedSpeedGovernor = null;
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
                  onTap: () => onSpeedGovernorSelected(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalTextPoppins(
                          text: 'Vehicle Model: ${item.vehicleModel ?? 'N/A'}',
                          color: Colors.black,
                          fontSize: 13,
                        ),
                        SizedBox(height: widget.media.height * 0.005),
                        NormalTextPoppins(
                          text: 'SG Model: ${item.sgModel ?? 'N/A'}',
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ],
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
