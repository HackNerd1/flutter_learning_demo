import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(title: const Text('New route')),
      body: Center(
        child: Column(
          children: [
            const Text('This is new route'),
            const Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: const Text('返回'))
          ],
        ),
      ),
    );
  }
}
