import 'package:flutter/material.dart';

import '../data/dummy_category.dart';
import '../components/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receições'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          children: DUMMY_CATEGORIES.map((item) {
            return CategoryItem(item);
          }).toList(),
        ),
      ),
    );
  }
}
