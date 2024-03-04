import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioRoute extends StatefulWidget {
  const DioRoute({super.key});

  @override
  State<DioRoute> createState() => _DioRouteState();
}

class _DioRouteState extends State<DioRoute> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView(
                  children: snapshot.data!.data.map<Widget>((value) {
                    return ListTile(
                      title: Text(value["full_name"]),
                    );
                  }).toList(),
                );
              }
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
