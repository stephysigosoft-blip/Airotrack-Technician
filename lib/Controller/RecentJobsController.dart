import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RecentJobsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("RecentJobsController initialized");
  }

  @override
  void onClose() {
    debugPrint("RecentJobsController disposed");
    super.onClose();
  }



  final filters = ["All", "New Installation", "Repair", "Replacement"];
  int selectedFilterIndex = 0;
  // Sample job data
  final List<Map<String, dynamic>> jobData = [
    {
      "title": "Speed Governor",
      "subtitle": "Repair",
      "location": "Mullakkal",
      "amount": "₹ 500",
      "statusText": "Payment Pending",
    },
    {
      "title": "AC Service",
      "subtitle": "Installation",
      "location": "Alappuzha",
      "amount": "₹ 1,200",
      "statusText": "Completed",
    },
    {
      "title": "Tyre Replacement",
      "subtitle": "2 Tyres",
      "location": "Kochi",
      "amount": "₹ 3,500",
      "statusText": "In Progress",
    },
    {
      "title": "Battery Check",
      "subtitle": "Replacement Required",
      "location": "Kottayam",
      "amount": "₹ 2,000",
      "statusText": "Pending Approval",
    },
  ];

}