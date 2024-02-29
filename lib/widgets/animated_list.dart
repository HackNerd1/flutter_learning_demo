import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _data = <String>[];

  int _counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < _counter; i++) {
      _data.add("${i + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedList(
          key: globalKey,
          initialItemCount: _data.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
                opacity: animation, child: buildItem(context, index));
          },
        ),
        buildButton()
      ],
    );
  }

  Widget buildItem(context, index) {
    String char = _data[index];

    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
          icon: const Icon(Icons.delete), onPressed: () => onDelete(index)),
    );
  }

  Widget buildButton() {
    return Positioned(
        bottom: 30,
        right: 0,
        left: 0,
        child: FloatingActionButton(
            onPressed: () {
              _data.add('${++_counter}');
              globalKey.currentState!.insertItem(_data.length - 1);
              print(
                'add ${_data.toString()}',
              );
            },
            child: const Icon(Icons.add)));
  }

  void onDelete(index) {
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        var item = buildItem(context, index);
        _data.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(
              curve: const Interval(0.0, 1.0), parent: animation),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );
      }, duration: const Duration(microseconds: 1000));
    });
  }
}
