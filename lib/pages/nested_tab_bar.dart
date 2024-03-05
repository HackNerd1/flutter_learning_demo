import 'package:flutter/material.dart';

class NestedTabBar extends StatelessWidget {
  const NestedTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    const tabs = ['猜你喜欢', '今日特价', '发现更多'];

    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            body: NestedScrollView(
          body: TabBarView(
            children: tabs
                .map((name) => Builder(
                      builder: (context) {
                        return CustomScrollView(
                          key: PageStorageKey(name),
                          slivers: [
                            SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context)),
                            SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              sliver: builderList(50),
                            )
                            // SliverPadding(padding: const EdgeInsets.all(8.0), sliver:)
                          ],
                        );
                      },
                    ))
                .toList(),
          ),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('商城'),
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: tabs.map((name) => Tab(text: name)).toList(),
                  ),
                ),
              )
            ];
          },
        )));
  }

  ListView builderList(num number) {
    final numList = [];

    for (var i = 0; i < number; i++) {
      numList.add(i);
    }

    return ListView(
      children: numList.map((number) => Text('$number')).toList(),
    );
  }
}
