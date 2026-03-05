import 'dart:io';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Widgets/ScannerRowWidget.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key, this.fromCheckinForm});
  final bool? fromCheckinForm;

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final MobileScannerController controller = MobileScannerController();
  bool isLoading = true;
  bool hasPermission = false;
  String? errorMessage;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
    _setupBarcodeDetection();
  }

  void _setupBarcodeDetection() {
    controller.barcodes.listen((barcodeCapture) {
      if (!_isProcessing) {
        _isProcessing = true;
        for (final barcode in barcodeCapture.barcodes) {
          if (barcode.rawValue == null || barcode.rawValue!.isEmpty) continue;

          showToast('Barcode Code Found: ${barcode.rawValue}');
          if (widget.fromCheckinForm == true) {
            Get.back(result: barcode.rawValue.toString());
          } else {
            debugPrint("Barcode: ${barcode.rawValue}");
            debugPrint("Navigating to Device Detail");
            Get.to(() => DeviceDetail(imei: barcode.rawValue.toString()))
                ?.then((_) {
              setState(() {
                _isProcessing = false;
              });
              controller.start();
            });
          }
          return;
        }
        // If the loop finishes without returning, it means no valid barcode was found
        _isProcessing = false;
      }
    });
  }

  Future<void> _initializeScanner() async {
    try {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        setState(() {
          hasPermission = true;
        });
        await controller.start();
      } else {
        showToast('Camera permission is required for QR scanning');
      }
    } catch (e) {
      debugPrint('Scanner initialization error: $e');
      setState(() {
        errorMessage = 'Failed to initialize camera: $e';
      });
      showToast('Failed to initialize camera: $e');
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.stop();
    }
    controller.start();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: colorPrimary))
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: media.height * 0.06),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    margin: EdgeInsets.only(left: media.width * 0.04),
                    child: SvgPicture.asset(
                      'lib/assets/images/close.svg',
                      width: media.width * 0.06,
                      height: media.height * 0.05,
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.04),
                hasPermission
                    ? Container(
                        height: media.height * 0.6,
                        margin: EdgeInsets.symmetric(
                            horizontal: media.height * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: MobileScanner(
                            controller: controller,
                          ),
                        ),
                      )
                    : Container(
                        height: media.height * 0.6,
                        margin: EdgeInsets.symmetric(
                            horizontal: media.height * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                errorMessage != null
                                    ? Icons.error_outline
                                    : Icons.camera_alt_outlined,
                                size: 64,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                errorMessage ?? 'Camera permission required',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                    errorMessage = null;
                                  });
                                  await _initializeScanner();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ),
                ScannerRowWidget(media: media, controller: controller)
              ],
            ),
    );
  }
}
