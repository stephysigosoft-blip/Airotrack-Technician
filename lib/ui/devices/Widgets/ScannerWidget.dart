import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'ScannerOverlay.dart';

class ScannerWidget extends StatelessWidget {
  const ScannerWidget({
    super.key,
    required this.media,
    required this.controller,
  });

  final Size media;
  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: media.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      height: media.height * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            SizedBox.expand(
              child: MobileScanner(
                controller: controller,
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: ScannerOverlay(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
