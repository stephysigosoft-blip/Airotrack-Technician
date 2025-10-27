import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/ui/utils/Functions/ProductIdToProduct.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:flutter/material.dart';

import '../../../Model/home_model.dart';
import '../../../assets/resources/colors.dart';
import '../JobItem.dart';

class WorkTypeDetails extends StatelessWidget {
  final String workStatus;
  final dynamic theme;
  final TabController tabController;
  final List<String> tab;
  final Function(Work) onAcceptTapped;
  final List<Work> pendingWorks;
  final bool isLoading;

  const WorkTypeDetails(
      {super.key,
      required this.workStatus,
      required this.theme,
      required this.tabController,
      required this.tab,
      required this.onAcceptTapped,
      required this.pendingWorks,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workStatus,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins-Bold'),
        ),
        SizedBox(height: media.height * 0.013),
        Material(
          color: theme.colorScheme.surface,
          elevation: 0,
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            indicator: const BoxDecoration(),
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(tab.length, (index) {
              return AnimatedBuilder(
                animation: tabController,
                builder: (context, _) {
                  final bool isSelected = tabController.index == index;
                  return Padding(
                    padding: EdgeInsets.only(right: media.width * 0.02),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: media.width * 0.03,
                          vertical: media.height * 0.01),
                      decoration: BoxDecoration(
                        color: isSelected ? colorPrimary : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? colorPrimary : colorPrimary,
                          width: media.width * 0.001,
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
                    ),
                  );
                },
              );
            }),
          ),
        ),
        SizedBox(height: media.height * 0.013),
        SizedBox(
          height: (pendingWorks.isEmpty ? 1 : pendingWorks.length) *
              (media.height * 0.32),
          child: TabBarView(
            controller: tabController,
            children: tab.map((t) {
              return isLoading
                  ? SizedBox(
                      height: media.height * 0.32,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: colorPrimary,
                      )),
                    )
                  : pendingWorks.isEmpty
                      ? const Center(
                          child: BoldTextPoppins(
                              text: Strings.noDataFound,
                              color: colorPrimary,
                              fontSize: 16))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pendingWorks.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: media.height * 0.01),
                              child: JobItem(
                                  location:
                                      pendingWorks[index].location.toString(),
                                  price: pendingWorks[index]
                                      .totalAmount
                                      .toString(),
                                  deviceName: pendingWorks[index]
                                      .productName
                                      .toString(),
                                  workType: (() {
                                    final v = int.tryParse(
                                        '${pendingWorks[index].serviceType}');
                                    return (v == null || v < 1 || v > 3)
                                        ? 'Unknown'
                                        : serviceIdToService(v);
                                  })(),
                                  onAcceptTapped: () =>
                                      onAcceptTapped(pendingWorks[index]),
                                  isUpcoming: false),
                            );
                          });
            }).toList(),
          ),
        ),
      ],
    );
  }
}
