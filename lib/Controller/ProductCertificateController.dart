import 'dart:io';

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

  Future<void> loadPdf() async {
    final bytes =
        await rootBundle.load("lib/assets/images/sample_certificate.pdf");
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/sample_certificate.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    localPdfPath = file.path;
    update();
  }
}
