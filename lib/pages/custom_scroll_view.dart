import 'package:flutter/material.dart';

class CustonScrollView extends StatelessWidget {
  const CustonScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CustomScrollView(slivers: [
      const SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
            background: Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/467367026/zh/%E7%85%A7%E7%89%87/perfect-sky-and-ocean.jpg?s=612x612&w=0&k=20&c=-ySPHrphbAcMnERRmqUvsCQPmC6UXh1DGS2pDXAWnFU='))),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: Text('grid item ${index + 1}'),
                    ),
                childCount: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0)),
      ),
      SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                  )),
          itemExtent: 50.0)
    ]));
  }
}
