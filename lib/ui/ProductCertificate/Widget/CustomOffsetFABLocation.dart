import 'package:flutter/material.dart';

class CustomOffsetFABLocation extends FloatingActionButtonLocation {
  final double offsetY;
  const CustomOffsetFABLocation(this.offsetY);
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final fabSize = scaffoldGeometry.floatingActionButtonSize;
    final contentWidth = scaffoldGeometry.scaffoldSize.width;
    final x = contentWidth - fabSize.width - 16.0;
    final y = scaffoldGeometry.scaffoldSize.height -
        fabSize.height -
        offsetY;
    return Offset(x, y);
  }
}