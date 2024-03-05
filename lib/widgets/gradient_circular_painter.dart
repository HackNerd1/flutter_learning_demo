import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter(
      {this.strokeWidth = 10.0,
      this.value = .0,
      this.radius = 1.0,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.strokeCapRound = false,
      this.total = 2 * pi});

  final double value;

  final double total;

  final double strokeWidth;

  final double radius;

  final bool strokeCapRound;

  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double _offset = strokeWidth / 2.0;
    double _value = value.clamp(.0, 1.0) * total;

    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;
    // 背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
