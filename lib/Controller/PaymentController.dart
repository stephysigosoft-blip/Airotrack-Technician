import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/Functions/network_testing.dart';
import 'package:airotrackgit/ui/utils/Functions/on_dio_exception.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
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
  bool isLoading = false;
  Dio dio = Dio();
  String qrCode = "";
  double qrCodeAmount = 0.0;

  Widget buildPaymentWidget(controller, Size media, double amount) {
    final method = controller.selectedMethod.toString();
    if (method == "Cash") {
      return NormalTextPoppins(
        text:
            "${Strings.pleaseCollect} ₹${amount.toStringAsFixed(0)} ${Strings.inCash}",
        color: Colors.black,
        fontSize: 13,
      );
    } else if (method == "Online") {
      return Center(
        child: qrCode.isNotEmpty
            ? PaymentQRWidget(
                amount: qrCodeAmount,
                qrImage: qrCode,
              )
            : const Center(child: CircularProgressIndicator()),
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

  Future<void> generateQrCode(
      String id, double amount, int paymentMethod) async {
    isLoading = true;
    checkNetworkAndRedirectOffAll();
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.generateQrCode;
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.queryParameters = {
        "job_id": id,
        "amount": amount,
        "payment_type": paymentMethod,
      };
      debugPrint("URL: $url");
      debugPrint("Query Parameters: ${dio.options.queryParameters}");
      debugPrint("Generating QR Code for amount: $amount");
      final response = await dio.post(url);
      debugPrint("Response Data: ${response.data}");
      if (response.statusCode == 200) {
        qrCode = response.data;
        qrCodeAmount = amount;
        update();
      } else {
        throw Exception("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        handleDioException(e);
      } else {
        debugPrint("Dio Exception without response: ${e.message}");
      }
    } catch (e) {
      debugPrint("Unexpected Error: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void onCashAndOnlinePayment(double amount, String jobId) {
    double cashAmount = double.parse(cashController.text);
    debugPrint("Cash Amount: $cashAmount");
    debugPrint("Amount: $amount");
    if (cashAmount == amount) {
      showToast("Amount equals total — choose online or cash payment.");
    } else if (amount > 0 && cashAmount < amount) {
      amount = amount - cashAmount;
      debugPrint("Amount after deduction: $amount");
      selectedMethod = "Online";
      generateQrCode(jobId, amount, 2);
      update();
    } else {
      showToast("Invalid amount");
    }
  }
}
