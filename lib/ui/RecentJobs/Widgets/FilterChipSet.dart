import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';

class FilterChipsList extends StatelessWidget {
  final List<String> filters;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final Size media;

  const FilterChipsList(
      {super.key,
      required this.filters,
      required this.selectedIndex,
      required this.onSelected,
      required this.media});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: media.height * 0.05,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FilterChip(
            showCheckmark: false,
            label: Text(
              filters[index],
              style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                  fontSize: 14, fontFamily: 'Poppins-Regular',fontWeight: FontWeight.bold),
            ),
            selected: selectedIndex == index,
            onSelected: (_) => onSelected(index),
            selectedColor: colorPrimary,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: selectedIndex == index ? Colors.transparent : colorPrimary,
              width: 1,
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(width: media.width * 0.02),
        itemCount: filters.length,
      ),
    );
  }
}
