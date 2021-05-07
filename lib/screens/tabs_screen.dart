import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

import '../model/meal.dart';

import '../screens/home_screen.dart';
import '../screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  //
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Responsavel por passar o index pelo array
  int _selectScreenIndex = 0;

  //Lista de map, pra buscar as telas definidas
  List<Map<String, Object>> _screens = [];

  // Sobreescrever função da tela de favoritos
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': HomeScreen(),
      },
      {
        'title': 'Lista de Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  // Método de navegação
  void _selectBottomBar(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectScreenIndex]['title'],
        ),
      ),

      body: _screens[_selectScreenIndex]['screen'],

      //Instanciando da classe main drawer
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos'),
          )
        ],
      ),
    );
  }
}
