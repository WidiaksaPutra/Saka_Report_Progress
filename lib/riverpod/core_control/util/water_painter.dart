import 'package:flutter/material.dart';
import '../../../shared/theme_color.dart';

class WaterPainter extends CustomPainter {
  final double waveHeight;
  WaterPainter({required this.waveHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kTransparentColor;
    canvas.drawRect(Rect.fromLTWH(0, size.height - waveHeight, size.width, waveHeight),paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}