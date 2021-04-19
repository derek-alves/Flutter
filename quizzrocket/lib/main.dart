import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
