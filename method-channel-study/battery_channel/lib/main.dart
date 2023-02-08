import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String batteryLevel = 'Waiting...';
  static const batteryChannel =
      MethodChannel('com.example.battery_channel/battery');

  @override
  void initState() {
    super.initState();

    onListBattery();
  }

  onListBattery() {
    batteryChannel.setMethodCallHandler((call) async {
      if (call.method == 'reportBatteryLevel') {
        final int batteryLevel = call.arguments;
        setState(() => this.batteryLevel = batteryLevel.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              batteryLevel,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: getBatteryLevel,
              child: const Text("Get Battery Level"),
            ),
          ],
        ),
      ),
    );
  }

  Future getBatteryLevel() async {
    final arguments = {'name': 'Derek Channel'};
    final String newBatteryLevel =
        await batteryChannel.invokeMethod('getBatteryLevel', arguments);

    setState(() => batteryLevel = newBatteryLevel.toString());
  }
}
