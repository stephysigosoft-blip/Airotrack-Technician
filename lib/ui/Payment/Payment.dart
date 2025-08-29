import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/resources/strings.dart';
import '../utils/Widgets/CustomDropDown.dart';
import 'RowWidgets/RowWidget3.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedMethod;
  final List<String> paymentMethods = [
    "UPI",
    "Credit Card",
    "Debit Card",
    "Net Banking",
    "Wallet",
  ];

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RowWidget3(
              text1: "Total",
              text2: "₹1200",
            ),
            SizedBox(height: media.height * 0.025),
            CustomDropdown(
              media: media,
              hintText: "Pick a Payment Method",
              items: paymentMethods,
              value: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedMethod == null
                    ? null
                    : () {
                        // Handle Generate Certificate
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Generate Certificate",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


