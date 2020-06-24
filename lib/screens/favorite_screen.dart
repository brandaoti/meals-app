import 'package:flutter/material.dart';

import '../components/category_meal_item.dart';

import '../model/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    // Implementando tela pra exibir as refeições favorita

    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Não há nenhuma refeição adicionada como favorito!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return CategoryMealItem(
            favoriteMeals[index],
          );
        },
      );
    }
  }
}
