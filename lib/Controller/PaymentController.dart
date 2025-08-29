import 'package:airotrackgit/ui/Payment/PaymentSuccess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/resources/strings.dart';
import '../ui/utils/Widgets/CashAmountField.dart';
import '../ui/utils/Widgets/NormalTextPoppins.dart';
import '../ui/utils/Widgets/PaymentQRWidget.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("PaymentController initialized");
  }

  @override
  void onClose() {
    debugPrint("PaymentController disposed");
    super.onClose();
  }

  String? selectedMethod;
  TextEditingController cashController = TextEditingController();
  final List<String> paymentMethods = ["Cash", "Online", "Cash + Online"];


  Widget buildPaymentWidget(controller, Size media) {
    final method = controller.selectedMethod.toString();
    if (method == "Cash") {
      return const NormalTextPoppins(
        text: "${Strings.pleaseCollect} ₹1200 ${Strings.inCash}",
        color: Colors.black,
        fontSize: 13,
      );
    } else if (method == "Online") {
      return const Center(
        child: PaymentQRWidget(
          amount: 1200,
          qrImage: "lib/assets/images/qr_image_dummy.png",
        ),
      );
    } else if (method == "Cash + Online") {
      return CashAmountField(
        media: media,
        controller: controller.cashController,
        onChanged: (val) {
          debugPrint("Amount: $val");
        },
      );
    }
    return const SizedBox.shrink();
  }
}
