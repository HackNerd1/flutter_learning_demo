import 'package:flutter/material.dart';

class TurnBoxt extends StatefulWidget {
  const TurnBoxt(
      {super.key, this.speed = 200, this.turns = .0, required this.child});

  final double turns;
  final int speed;
  final Widget child;

  @override
  State<TurnBoxt> createState() => _TurnBoxtState();
}

class _TurnBoxtState extends State<TurnBoxt>
    with SingleTickerProviderStateMixin {
  // 动画controller
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return widget.child;
    return RotationTransition(turns: _animationController, child: widget.child);
  }

  @override
  void didUpdateWidget(covariant TurnBoxt oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.turns != widget.turns) {
      _animationController.animateTo(widget.turns,
          duration: Duration(microseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}
