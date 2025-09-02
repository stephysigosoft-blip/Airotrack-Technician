import 'package:airotrackgit/Controller/RecentJobsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/resources/strings.dart';
import '../utils/Widgets/RecentJobsAppBar.dart';
import 'Widgets/DateText.dart';
import 'Widgets/FilterChipSet.dart';
import 'Widgets/JobCard.dart';

class RecentJobsScreen extends StatelessWidget {
  const RecentJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return GetBuilder(
      init: RecentJobsController(),
      builder: (controller) => Scaffold(
        appBar: RecentJobsAppBar(
            title: Strings.recentJobs, onTap: () => Get.back()),
        body: Padding(
          padding: EdgeInsets.all(media.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterChipsList(
                filters: controller.filters,
                selectedIndex: controller.selectedFilterIndex,
                onSelected: (index) {
                  controller.selectedFilterIndex = index;
                  controller.update();
                },
                media: media,
              ),
              SizedBox(height: media.height * 0.02),
              const DateText(date: "20 Aug 2023"),
              SizedBox(height: media.height * 0.02),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => JobCard(
                            title: controller.jobData[index]["title"],
                            subtitle: controller.jobData[index]["subtitle"],
                            location: controller.jobData[index]["location"],
                            media: media,
                            amount: controller.jobData[index]["amount"],
                            statusText: controller.jobData[index]["statusText"],
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: media.height * 0.01),
                      itemCount: controller.jobData.length))
            ],
          ),
        ),
      ),
    );
  }
}
