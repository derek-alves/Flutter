import 'package:feichas/features/items/presenter/list_screen.dart';
import 'package:feichas/features/items/presenter/list_screen_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feichas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => ListScreen(),
          binding: ListScreenBindings(),
        )
      ],
    );
  }
}
