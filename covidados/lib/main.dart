import 'package:covidados/src/presentation/homePage/home_page.dart';
import 'package:covidados/src/presentation/landingPage/landing_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'src/utils/app_routes.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xff3AD39C),
      ),
      home: LandingPage(),
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
      },
    );
  }
}
