import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implements build Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Refeições',
      home: HomeScreen(),
    );
  }
}
