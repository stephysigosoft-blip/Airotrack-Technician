import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QrViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("QrViewController initialized");
  }

  @override
  void onClose() {
    debugPrint("QrViewController disposed");
    super.onClose();
  }
}
