import 'dart:io';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'Widgets/ScannerRowWidget.dart';
import 'Widgets/ScannerWidget.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final MobileScannerController controller = MobileScannerController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeScanner();
  }

  Future<void> _initializeScanner() async {
    await controller.start();
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
                ScannerWidget(media: media, controller: controller),
                ScannerRowWidget(media: media)
              ],
            ),
    );
  }
}
