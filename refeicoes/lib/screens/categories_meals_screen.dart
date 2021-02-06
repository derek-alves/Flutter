// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

import 'package:refeicoes/models/meal.dart';
import '../models/category.dart';
import '../components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: NewWidget(categoryMeals: categoryMeals),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.categoryMeals,
  }) : super(key: key);

  final List<Meal> categoryMeals;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
