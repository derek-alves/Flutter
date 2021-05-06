import 'package:covidados/core/utils/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'features/presenter/homePage/home_page.dart';
import 'features/presenter/landingPage/landing_page.dart';
import 'features/presenter/symptomsPage/symptoms_page.dart';

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
        AppRoutes.SYMPTOMS_PAGE: (ctx) => SymptomsPage(),
      },
    );
  }
}
