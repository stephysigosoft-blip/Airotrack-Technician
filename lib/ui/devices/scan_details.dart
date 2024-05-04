import 'package:flutter/material.dart';

import 'QrScannerOverlayShape.dart';

class ScanDetails extends StatefulWidget {
  const ScanDetails({super.key});

  @override
  State<ScanDetails> createState() => _SacnDetailsState();
}

class _SacnDetailsState extends State<ScanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderRadius: 10,
                  borderLength: 20,
                  borderWidth: 5,
                  cutOutSize: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
