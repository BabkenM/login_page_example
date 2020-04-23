import 'dart:ui';

import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter{
  Color _backgroundPaintColor = Color(0xff1D2236);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 1, size.height * 0.1,
        size.width * 1.0, size.height * 0.8);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    paint.color = _backgroundPaintColor;
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}