import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({super.key});

  @override
  State<ScrollControllerTestRoute> createState() =>
      _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  final ScrollController _controller = ScrollController();

  bool showBtn = false;

  int _progress = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      // print(_controller.offset);
      if (_controller.offset < 1000 && showBtn) {
        setState(() {
          showBtn = false;
        });
      } else if (_controller.offset >= 1000 && showBtn == false) {
        setState(() {
          showBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动控制"),
      ),
      body: Scrollbar(
        controller: _controller,
        child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              setState(() {
                _progress = (progress * 100).toInt();
              });
              return false;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  child: Text("$_progress"),
                ),
                ListView.builder(
                  itemBuilder: (context, index) =>
                      ListTile(title: Text('$index')),
                  itemCount: 100,
                  itemExtent: 50,
                  controller: _controller,
                ),
              ],
            )),
      ),
      floatingActionButton: !showBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(
                  .0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}
