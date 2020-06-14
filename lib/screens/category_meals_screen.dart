import 'package:flutter/material.dart';

import '../components/meal_items.dart';

import '../model/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implements build Scaffold, exibir refeições
    return Scaffold(
      appBar: AppBar(
        title: Text('//category.title,'),
      ),
      body: ListView.builder(
        itemCount: 1, // Precisa passar as refeições aqui
        itemBuilder: (context, index) {
          return MealItems();
        },
      ),
    );
  }
}
