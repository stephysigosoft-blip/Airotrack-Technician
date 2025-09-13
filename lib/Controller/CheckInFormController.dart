import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../assets/resources/colors.dart';

class CheckInFormController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("CheckInFormController initialized");
  }

  @override
  void onClose() {
    debugPrint("CheckInFormController disposed");
    super.onClose();
  }


  Widget buildImageBox(Size media, String imageUrl) {
    return Container(
      height: media.width * 0.3,
      width: media.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget buildAddImageBox(Size media) {
    return Container(
      height: media.width * 0.3,
      width: media.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: greyFillColor,
      ),
      child: const Center(
        child: Icon(Icons.add, size: 40, color: colorPrimary),
      ),
    );
  }
}


