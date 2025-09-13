import 'package:airotrackgit/Controller/EarningsController.dart';
import 'package:airotrackgit/ui/Earnings/Widgets/TotalEarningsWidget.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:airotrackgit/ui/utils/Widgets/RecentJobsAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../assets/resources/strings.dart';
import 'Widgets/DateSelectionWidget.dart';
import 'Widgets/EarningCard.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: GetBuilder(
        init: EarningsController(),
        builder: (controller) => Scaffold(
          appBar: RecentJobsAppBar(
            title: Strings.earnings,
            onTap: () => Get.back(),
          ),
          body: Padding(
            padding: EdgeInsets.all(media.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateSelectionWidget(
                  media: media,
                  fromDate: controller.fromDateController.text,
                  toDate: controller.toDateController.text,
                  onFromDateTap: () => controller.onFromDateTapped(context),
                  onToDateTap: () => controller.onToDateTapped(context),
                ),
                SizedBox(height: media.height * 0.02),
                TotalEarningsWidget(
                  media: media,
                  fromDate: "17/06/2025",
                  toDate: "18/06/2025",
                  totalAmount: "₹6600",
                ),
                SizedBox(height: media.height * 0.02),
                const BoldTextPoppins(
                    text: "18 June 2025", color: Colors.black, fontSize: 17),
                SizedBox(height: media.height * 0.01),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final item = controller.earnings[index];
                      return EarningCard(
                        media: media,
                        location: item["location"]!,
                        product: item["product"]!,
                        amount: item["amount"]!,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: media.height * 0.003,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
