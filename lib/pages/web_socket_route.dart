/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-04 21:45:51
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-04 22:00:59
 */
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketRoute extends StatefulWidget {
  const WebSocketRoute({super.key});

  @override
  State<WebSocketRoute> createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  final TextEditingController _controller = TextEditingController();
  late IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    // channel = IOWebSocketChannel.connect("wss://echo.websocket.events");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Form(
              child: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(labelText: "Send a message"),
          )),
          // StreamBuilder(
          //   stream: channel.stream,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     } else if (snapshot.hasData) {
          //       return Text(snapshot.data.toString());
          //     }

          //     return const CircularProgressIndicator();
          //   },
          // ),
          FloatingActionButton(
            onPressed: _sendMessage,
            tooltip: 'Send message',
            child: const Icon(Icons.send),
          )
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    channel.sink.close();
  }
}
