import 'package:flutter/material.dart';

import '../components/category_meal_item.dart';

import '../model/category.dart';
import '../model/meal.dart';

class MealScreen extends StatelessWidget {
  // Listagem de refeições
  final List<Meal> meal;

  // Filragem de dados passando pra class filho
  const MealScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    // Implements ModalRoute
    final category = ModalRoute.of(context).settings.arguments as Category;

    //
    final categoryMeals = meal.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    // Implements build Scaffold, exibir refeições
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return CategoryMealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
