import 'package:flutter/material.dart';

class ScannerOverlay extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = Colors.black.withOpacity(0.5);
    final overlay = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final cutOutRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 300,
      height: 300,
    );
    final cutOut = Path()..addRect(cutOutRect);
    final finalPath = Path.combine(PathOperation.difference, overlay, cutOut);
    canvas.drawPath(finalPath, overlayPaint);
    final framePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.square;
    const frameLength = 30.0;
    final topLeft = Path()
      ..moveTo(cutOutRect.left, cutOutRect.top + frameLength)
      ..lineTo(cutOutRect.left, cutOutRect.top)
      ..lineTo(cutOutRect.left + frameLength, cutOutRect.top);
    canvas.drawPath(topLeft, framePaint);
    final topRight = Path()
      ..moveTo(cutOutRect.right - frameLength, cutOutRect.top)
      ..lineTo(cutOutRect.right, cutOutRect.top)
      ..lineTo(cutOutRect.right, cutOutRect.top + frameLength);
    canvas.drawPath(topRight, framePaint);
    final bottomLeft = Path()
      ..moveTo(cutOutRect.left, cutOutRect.bottom - frameLength)
      ..lineTo(cutOutRect.left, cutOutRect.bottom)
      ..lineTo(cutOutRect.left + frameLength, cutOutRect.bottom);
    canvas.drawPath(bottomLeft, framePaint);
    final bottomRight = Path()
      ..moveTo(cutOutRect.right - frameLength, cutOutRect.bottom)
      ..lineTo(cutOutRect.right, cutOutRect.bottom)
      ..lineTo(cutOutRect.right, cutOutRect.bottom - frameLength);
    canvas.drawPath(bottomRight, framePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}