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

  // Filtragem de refeições favorita
  List<Meal> _favoriteMeals = [];

  // Instancia responsavel por armazenar o estado
  Settings settings = Settings();

  // Função responsavel pela filtragem
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

  // Método pra add refeições
  void _addFavoriteMeals(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  // Função pra retornar as refeições favoritada
  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
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
        AppRouter.HOME: (ctx) => TabsScreen(
              _favoriteMeals,
            ),
        AppRouter.MEAL_SCREEN: (ctx) => MealScreen(_availableMeal),
        AppRouter.MEAL_DETAIL_SCREEN: (ctx) => MealDetailScreen(
              _addFavoriteMeals,
              _isFavorite,
            ),
        AppRouter.SETTINGS: (ctx) => SettingsScreen(_filterMeal, settings),
      },
    );
  }
}
