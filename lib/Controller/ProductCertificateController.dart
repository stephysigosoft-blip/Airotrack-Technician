import 'dart:io';

import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/Functions/network_testing.dart';
import 'package:airotrackgit/ui/utils/Functions/on_dio_exception.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';

class ProductCertificateController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("ProductCertificateController initialized");
    loadPdf();
  }

  @override
  void onClose() {
    debugPrint("ProductCertificateController disposed");
    super.onClose();
  }

  String? localPdfPath;
  bool isLoading = false;
  Dio dio = Dio();
  String productCertificate = "";

  Future<void> loadPdf() async {
    final bytes =
        await rootBundle.load("lib/assets/images/sample_certificate.pdf");
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/sample_certificate.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    localPdfPath = file.path;
    update();
  }

  Future<void> generateProductCertificate(String id) async {
    isLoading = true;
    checkNetworkAndRedirectOffAll();
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.generateProductCertificate;
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.queryParameters = {
        "job_id": id,
      };
      debugPrint("URL: $url");
      debugPrint("Query Parameters: ${dio.options.queryParameters}");
      final response = await dio.get(url);
      debugPrint("Response Data: ${response.data}");
      if (response.statusCode == 200) {
        productCertificate = response.data;
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
}
