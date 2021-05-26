import 'package:covidados/core/utils/app_routes.dart';
import 'package:covidados/features/presenter/contagionPage/contagion_page.dart';
import 'package:covidados/features/presenter/homePage/bindings_home_page.dart';
import 'package:covidados/features/presenter/preventionPage/prevention_page1.dart';
import 'package:covidados/features/presenter/virusPage/virus_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Covid Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Color(0xff3AD39C),
      ),
      initialRoute: AppRoutes.LANDING_PAGE,
      getPages: [
        GetPage(name: AppRoutes.LANDING_PAGE, page: () => LandingPage()),
        GetPage(
          name: AppRoutes.HOME,
          page: () => HomePage(),
          binding: HomePageBindings(),
          children: [
            GetPage(
              name: AppRoutes.SYMPTOMS_PAGE,
              page: () => SymptomsPage(),
            ),
            GetPage(
              name: AppRoutes.PREVENTION_PAGE,
              page: () => PreventionPage(),
            ),
            GetPage(
              name: AppRoutes.CONTAGION_PAGE,
              page: () => ContagionPage(),
            ),
            GetPage(
              name: AppRoutes.VIRUS_PAGE,
              page: () => VirusPage(),
            ),
          ],
        ),
      ],
    );
  }
}
