import 'package:flutter/material.dart';

class TabViewRoute extends StatelessWidget {
  const TabViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List tabs = ["新闻", "历史", "图片"];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("App name"),
            bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
          ),
          body: TabBarView(
            children: tabs
                .map((e) => Container(
                    alignment: Alignment.center,
                    child: Text(
                      e,
                    )))
                .toList(),
          ),
        ));
  }
}
