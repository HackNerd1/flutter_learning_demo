import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  const InfiniteGridView({super.key});

  @override
  State<InfiniteGridView> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  final List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    _renderIcon();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.0),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && _icons.length < 200) {
          _renderIcon();
        }

        return Icon(_icons[index]);
      },
    );
  }

  void _renderIcon() {
    Future.delayed(const Duration(microseconds: 200)).then((value) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
