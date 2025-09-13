import 'package:airotrackgit/Controller/PaymentController.dart';
import 'package:airotrackgit/ui/Payment/PaymentSuccess.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/resources/strings.dart';
import '../utils/Widgets/ColorChangingButton.dart';
import '../utils/Widgets/CustomDropDown.dart';
import 'RowWidgets/RowWidget3.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

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
        child: SafeArea(
          top: false,
          child: GetBuilder(
            init: PaymentController(),
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RowWidget3(
                  text1: Strings.total,
                  text2: "₹1200",
                ),
                SizedBox(height: media.height * 0.025),
                CustomDropdown(
                  media: media,
                  hintText: Strings.pickAPaymentMethod,
                  items: controller.paymentMethods,
                  value: controller.selectedMethod,
                  onChanged: (value) {
                    controller.selectedMethod = value;
                    controller.update();
                  },
                ),
                SizedBox(height: media.height * 0.025),
                controller.buildPaymentWidget(controller, media),
                const Spacer(),
                ColorChangingButton(
                    onTap: () => Get.to(() => const PaymentSuccess()),
                    selectedMethod: controller.selectedMethod,
                    media: media),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
