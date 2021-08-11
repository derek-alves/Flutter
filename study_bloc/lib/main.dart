import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc/features/product/page/product_page.dart';

import 'features/product/bloc/product_bloc.dart';
// import 'package:study_bloc/pages/home/bloc/home_bloc.dart';
// import 'package:study_bloc/pages/home/bloc/home_event.dart';
// import 'package:study_bloc/pages/home/bloc/home_state.dart';
// import 'package:study_bloc/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
          child: ProductPage(key: null),
        )

        // BlocProvider<HomeBloc>(
        //     create: (BuildContext context) =>
        //         HomeBloc(HomeLoadingState())..add(HomeFetchList()),
        //     child: const HomePage()),
        );
  }
}
