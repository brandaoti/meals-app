import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  // implement widget Drawer,
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Vamos Cozinhar?'),
          ),
        ],
      ),
    );
  }
}
