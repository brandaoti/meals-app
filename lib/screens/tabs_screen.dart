import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

import '../screens/home_screen.dart';
import '../screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  // Responsavel por passar o index pelo array
  final _selectScreenIndex = 0;

  //Lista de map, pra buscar as telas definidas
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Lista de Categorias',
      'screen': HomeScreen(),
    },
    {
      'title': 'Lista de Favoritos',
      'screen': FavoriteScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Categorias'),
      ),

      // TODO: Chamar por um array com as tela
      body: _screens[_selectScreenIndex]['screen'],

      //Instanciando da classe main drawer
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
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
