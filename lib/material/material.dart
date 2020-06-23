import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

import '../data/dummy_category.dart';

import '../model/meal.dart';
import '../model/settings.dart';

import '../screens/tabs_screen.dart';
import '../screens/meals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/settings_screen.dart';

class MyMaterialApp extends StatefulWidget {
  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  // Filtrar as refeições disponiveis
  List<Meal> _availableMeal = DUMMY_MEALS;

  // Instancia responsavel por armazenar o estado
  Settings settings = Settings();

  void _filterMeal(Settings settings) {
    setState(() {
      //recebendo estado atual
      this.settings = settings;

      // Recebe os dados atualizados da lista
      _availableMeal = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGluttenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Implements build Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Refeições',
      //home: HomeScreen(),
      // Passando rotas nomeadas
      routes: {
        AppRouter.HOME: (ctx) => TabsScreen(),
        AppRouter.MEAL_SCREEN: (ctx) => MealScreen(_availableMeal),
        AppRouter.MEAL_DETAIL_SCREEN: (ctx) => MealDetailScreen(),
        AppRouter.SETTINGS: (ctx) => SettingsScreen(_filterMeal, settings),
      },
    );
  }
}
