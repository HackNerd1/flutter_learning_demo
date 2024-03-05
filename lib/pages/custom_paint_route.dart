import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_demo/widgets/my_painter.dart';

class CustomPaintRpute extends StatelessWidget {
  const CustomPaintRpute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RepaintBoundary(
              child: CustomPaint(
                  size: const Size(300, 300), painter: MyPainter())),
          ElevatedButton(onPressed: () {}, child: const Text("刷新"))
        ],
      ),
    );
  }
}
