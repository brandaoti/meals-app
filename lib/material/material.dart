import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

import '../screens/home_screen.dart';
import '../screens/meals_screen.dart';
import '../screens/meal_detail_screen.dart';

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
        AppRouter.MEAL_SCREEN: (ctx) => MealScreen(),
        AppRouter.MEAL_DETAIL_SCREEN: (ctx) => MealDetailScreen(),
      },
    );
  }
}
