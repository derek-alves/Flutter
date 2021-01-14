

import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
          ),
        )
      ],)
    );
  }
}
