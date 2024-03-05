import 'package:flutter/material.dart';
import 'package:learning_demo/widgets/gradient_buttron.dart';

class FutureBuilderTest extends StatelessWidget {
  const FutureBuilderTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        )),
        GradientButton(
          colors: const [Colors.orange, Colors.red],
          onPressed: onPress,
          height: 50.0,
          child: const Text("渐变按钮"),
        ),
      ],
    );
  }

  Future getData() {
    return Future.delayed(const Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  void onPress() {
    print("click");
  }
}
