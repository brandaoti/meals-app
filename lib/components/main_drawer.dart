import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  @override
  // implement widget Drawer,
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.deepOrange,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Vamos Cozinhar?',
                style: TextStyle(
                  fontFamily: 'Kreon',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // ListTile: Contem navegação entre telas //
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'Refeições',
              style: TextStyle(
                fontFamily: 'Kreon',
                fontSize: 16,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRouter.HOME),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Configurações',
              style: TextStyle(
                fontFamily: 'Kreon',
                fontSize: 16,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRouter.SETTINGS),
          ),
        ],
      ),
    );
  }
}
