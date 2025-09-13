import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("NotificationController initialized");
  }

  @override
  void onClose() {
    debugPrint("NotificationController disposed");
    super.onClose();
  }

  final List<String> notifications = [
    "Your order #1245 has been shipped.",
    "You received a new message from support.",
    "Your payment of ₹850 was successful.",
    "Update available! Please update to the latest version.",
    "Reminder: Meeting at 3:00 PM today.",
    "Special offer: Get 20% off on your next purchase.",
    "Password changed successfully.",
    "Your friend invited you to join their group.",
    "System maintenance scheduled for tonight.",
    "Welcome back! We missed you.",
  ];
}
