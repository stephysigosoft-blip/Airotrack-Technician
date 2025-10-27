import 'package:airotrackgit/ui/ProductCertificate/ProductCertificate.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/resources/strings.dart';
import '../utils/Widgets/CustomAppBar.dart';
import '../utils/Widgets/PaymentStatusWidget.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key, required this.amount, required this.jobId});
  final double amount;
  final String jobId;

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

String? selectedMethod;

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Strings.payment,
          onBack: () => Get.back(),
        ),
        body: Padding(
          padding: EdgeInsets.all(media.width * 0.04),
          child: Column(
            children: [
              SizedBox(height: media.height * 0.17),
              PaymentStatusWidget(
                  amount: widget.amount,
                  message: Strings.paymentReceived,
                  media: media),
              const Spacer(),
              SizedBox(height: media.height * 0.1),
              CheckInButton(
                media: media,
                buttonText: Strings.generateCertificate,
                onTap: () => Get.to(() =>  ProductCertificateScreen(jobId: widget.jobId)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
