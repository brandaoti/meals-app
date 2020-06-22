import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

import '../model/settings.dart';

class SettingsScreen extends StatelessWidget {
  final settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text('Configurações'),
          ),

          //
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile.adaptive(
                  title: Text('Sem gluten'),
                  subtitle: Text('Só exibir refeições sem gluten.'),
                  value: settings.isGluttenFree,
                  onChanged: (i) {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
