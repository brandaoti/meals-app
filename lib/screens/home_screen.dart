import 'package:flutter/material.dart';

import '../data/dummy_category.dart';
import '../components/category_itens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implements build Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Refeições'),
        centerTitle: true,
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
            return CategoryItens(item);
          }).toList(),
        ),
      ),
    );
  }
}
