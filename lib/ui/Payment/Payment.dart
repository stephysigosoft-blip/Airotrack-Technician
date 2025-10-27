import 'package:airotrackgit/Controller/PaymentController.dart';
import 'package:airotrackgit/ui/Payment/PaymentSuccess.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/resources/strings.dart';
import '../utils/Widgets/ColorChangingButton.dart';
import '../utils/Widgets/CustomDropDown.dart';
import 'RowWidgets/RowWidget3.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.amount, required this.jobId});
  final double amount;
  final String jobId;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: Strings.payment,
        onBack: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.all(media.width * 0.04),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: media.height,
            width: media.width,
            child: SafeArea(
              top: false,
              child: GetBuilder(
                init: PaymentController(),
                builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowWidget3(
                      text1: Strings.total,
                      text2: "₹${widget.amount.toStringAsFixed(0)}",
                    ),
                    SizedBox(height: media.height * 0.025),
                    CustomDropdown(
                      media: media,
                      hintText: Strings.pickAPaymentMethod,
                      items: controller.paymentMethods,
                      value: controller.selectedMethod,
                      onChanged: (value) {
                        controller.selectedMethod = value;
                        if (value == "Online") {
                          controller.generateQrCode(
                              widget.jobId, widget.amount, 2);
                        }
                        controller.update();
                      },
                    ),
                    SizedBox(height: media.height * 0.025),
                    controller.buildPaymentWidget(
                        controller, media, widget.amount),
                    const Spacer(),
                    ColorChangingButton(
                        amount: widget.amount,
                        onTap: () =>
                            controller.selectedMethod == "Cash + Online"
                                ? controller.cashController.text.isEmpty
                                    ? showToast("Please enter the cash amount")
                                    : controller.onCashAndOnlinePayment(
                                        widget.amount, widget.jobId)
                                : Get.to(() => PaymentSuccess(
                                    amount: widget.amount,
                                    jobId: widget.jobId)),
                        selectedMethod: controller.selectedMethod,
                        media: media),
                    SizedBox(height: media.height * 0.16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
