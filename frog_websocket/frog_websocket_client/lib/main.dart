import 'package:flutter/material.dart';
import 'package:web_socket_client/web_socket_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Frog Websocket'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebSocket channel;
  String webSocketValue = 'initial';
  String connection = 'desconected';

  void _webSocketValue(String value) {
    setState(() {
      webSocketValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    final uri = Uri.parse('ws://192.168.1.4:8080/ws');
    channel = WebSocket(uri);

    channel.connection.listen((event) {
      setState(() {
        print(event);
        connection = event is Connected || event is Reconnected
            ? "connected"
            : 'disconnected';
      });
    });
    channel.messages.listen((message) {
      print("socket $message");
      _webSocketValue(message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    channel.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(connection),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              webSocketValue,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => channel.send(Message.increment.value),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum Message {
  /// An increment message.
  increment('__increment__'),

  /// A decrement message.
  decrement('__decrement__');

  /// {@macro message}
  const Message(this.value);

  /// The value of the message.
  final String value;
}
