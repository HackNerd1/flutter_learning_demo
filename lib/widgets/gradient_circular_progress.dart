import 'package:flutter/material.dart';
import 'package:learning_demo/widgets/gradient_circular_painter.dart';

class GradientCircularProgress extends StatelessWidget {
  const GradientCircularProgress({super.key, required this.radius});

  /// 圆的半径
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(),
    );
  }
}
