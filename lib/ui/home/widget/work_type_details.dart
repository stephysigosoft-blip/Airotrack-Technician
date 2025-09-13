import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../assets/resources/colors.dart';
import '../JobItem.dart';

class WorkTypeDetails extends StatelessWidget {
  final String workType;
  final dynamic theme;
  final TabController tabController;
  final List<String> tab;
  final VoidCallback onAcceptTapped;

  const WorkTypeDetails(
      {super.key,
      required this.workType,
      required this.theme,
      required this.tabController,
      required this.tab,
      required this.onAcceptTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
          child: Text(
            workType,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins-Bold'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Material(
            color: theme.colorScheme.surface,
            elevation: 0,
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              indicator: const BoxDecoration(),
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(right: 8),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: List.generate(tab.length, (index) {
                final bool isSelected = tabController.index == index;
                return AnimatedBuilder(
                  animation: tabController,
                  builder: (context, _) {
                    final bool isSelected = tabController.index == index;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? colorPrimary : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? colorPrimary : colorPrimary,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tab[index],
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.00,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: tab.length * 100,
          child: TabBarView(
            controller: tabController,
            children: tab.map((t) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return JobItem(onAcceptTapped: () => onAcceptTapped());
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
