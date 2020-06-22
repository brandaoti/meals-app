import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refeições'),
      ),
      drawer: MainDrawer(),
    );
  }
}
