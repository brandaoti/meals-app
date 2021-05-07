import 'package:flutter/foundation.dart';

//
enum Complexity {
  Simple, // Simples
  Medium, // Normal
  Difficult, // Dificil
}

//
enum Cost {
  Cheap, // Barato
  Fair, // Justo
  Expensive // Caro
}

class Meal {
  //
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.complexity,
    @required this.cost,
  });

  // Método pra verificar a dificuldade em preparar a refeição
  String get complexityText {
    switch (complexity) {
      //
      case Complexity.Simple:
        return 'Simples';
        break;

      case Complexity.Medium:
        return 'Normal';
        break;

      case Complexity.Difficult:
        return 'Difícil';
        break;

      default:
        return 'Nenhuma informação do trabalho';
    }
  }

  // Método pra verificar o preço gasto na refeição
  String get costText {
    switch (cost) {
      //
      case Cost.Cheap:
        return 'Barato';
        break;

      case Cost.Fair:
        return 'Médio';
        break;

      case Cost.Expensive:
        return 'Caro';
        break;

      default:
        return 'Nenhuma valor definido';
    }
  }
}
