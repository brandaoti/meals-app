import 'package:flutter/material.dart';

import '../components/category_item.dart';

import '../data/dummy_category.dart';

import '../routes/app_routes.dart';

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
            return CategoryItem(item);
          }).toList(),
        ),
      ),
    );
  }
}
