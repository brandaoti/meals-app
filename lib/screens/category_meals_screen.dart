import 'package:flutter/material.dart';

import '../model/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  const CategoryMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    // Implements build Scaffold, exibir refeições
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
      ),
    );
  }
}
