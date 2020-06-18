import 'package:flutter/material.dart';

import '../data/dummy_category.dart';
import '../components/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implements build Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Refeições'),
        centerTitle: true,
      ),
      // Drawer para settings e meals navigation
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.greenAccent,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              child: Text(
                'Vamos Cozinhar?',
                style: TextStyle(fontFamily: 'Kreon', fontSize: 20),
              ),
            ),
            //
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('Refeições'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Layout for gridView
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES.map((item) {
            return CategoryItem(item);
          }).toList(),
        ),
      ),
    );
  }
}
