import 'package:flutter/material.dart';

import '../model/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // Instancia da classe Category, pegando os atributos passado no construtor
  final Category category;
  // Construtor
  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryMealsScreen(category);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Container responsavel pela cor, chamando um array de LinearGradient
    return InkWell(
      // Resposavel por chamar a função pra navegar entre telas
      onTap: () => _selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // Passando titulo das refeições
          child: Text(category.title),
        ),
      ),
    );
  }
}
