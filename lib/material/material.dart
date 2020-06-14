import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

import '../screens/home_screen.dart';
import '../screens/category_meals_screen.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implements build Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Refeições',
      home: HomeScreen(),
      // Passando rotas nomeadas
      routes: {
        AppRouter.HOME: (ctx) => HomeScreen(),
        AppRouter.CATEGORIES_MEAL_SCREEN: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
