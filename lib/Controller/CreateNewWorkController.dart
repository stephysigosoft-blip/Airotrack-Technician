import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateNewWorkController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("CreateNewWorkController initialized");
  }

  @override
  void onClose() {
    debugPrint("CreateNewWorkController disposed");
    super.onClose();
  }
  final productList = ["GPS Tracker", "Dashcam", "Other"];
  final workTypes = ["Repair", "Installation", "Service"];
  String? selectedProduct = "";
  String? selectedWorkType = "";
}
