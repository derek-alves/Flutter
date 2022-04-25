import 'package:animated_container/splash_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

Future<void> cache() async {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Image background;
  late final Image logo;

  @override
  void initState() {
    super.initState();
    background = Image.asset("assets/backred.png");
    logo = Image.asset("assets/logo.png");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(background.image, context);
    precacheImage(logo.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.red,
          backgroundColor: Colors.amber),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        'home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
      },
    );
  }
}
