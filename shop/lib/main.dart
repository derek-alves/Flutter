import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/views/products_detail_screen.dart';
import 'package:shop/views/products_overview_screen.dart';
import './utils/app_routes.dart';
import './provider/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=>Products(),
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          textTheme: TextTheme()
        ),
        home: ProductOverViewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
