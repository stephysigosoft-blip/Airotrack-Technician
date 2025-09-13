import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ServiceDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("ServiceDetailsController initialized");
  }

  @override
  void onClose() {
    debugPrint("ServiceDetailsController disposed");
    super.onClose();
  }
}
