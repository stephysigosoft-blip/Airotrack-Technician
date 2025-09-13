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
      ),
      height: media.height * 0.6,
      child: Stack(
        children: [
          MobileScanner(
            controller: controller,
            scanWindow: Rect.fromCenter(
              center: const Offset(200, 225),
              width: media.width - 40,
              height: media.height * 0.4,
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: ScannerOverlay(),
            ),
          ),
        ],
      ),
    );
  }
}