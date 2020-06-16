import 'package:flutter/material.dart';

import '../components/meal_itens.dart';

import '../data/dummy_category.dart';

import '../model/category.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implements ModalRoute
    final category = ModalRoute.of(context).settings.arguments as Category;

    //
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    // Implements build Scaffold, exibir refeições
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length, // Precisa passar as refeições aqui
        itemBuilder: (context, index) {
          return MealItens(categoryMeals[index]);
        },
      ),
    );
  }
}
