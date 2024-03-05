import 'package:flutter/material.dart';
import 'package:learning_demo/widgets/turn_box.dart';

class TurnBoxRoute extends StatefulWidget {
  const TurnBoxRoute({super.key});

  @override
  State<TurnBoxRoute> createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TurnBoxt(
          turns: _turns,
          child: const Icon(
            Icons.refresh,
            size: 50,
          ),
        ),
        // TurnBoxt(
        //   turns: _turns,
        //   speed: 500,
        //   child: const Icon(
        //     Icons.refresh,
        //     size: 50,
        //   ),
        // ),
        // TurnBoxt(
        //   turns: _turns,
        //   speed: 1000,
        //   child: const Icon(
        //     Icons.refresh,
        //     size: 50,
        //   ),
        // ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _turns += 0.2;
              });
            },
            child: const Text("顺时针旋转1/5")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _turns -= 0.2;
              });
            },
            child: const Text("逆时针旋转1/5"))
      ],
    );
  }
}
