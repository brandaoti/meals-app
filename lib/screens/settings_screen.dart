import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

import '../model/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;

  // Função pra ativar as configurações
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Responsavel por pegar os atributos de settings
  final settings = Settings();

  // Switch das configurações
  Widget _createSwitch(
    String title,
    String subtitle,
    bool isSelected,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: isSelected,
      onChanged: (value) {
        onChanged(value);

        widget.onSettingsChanged(settings);
      },
    );
  }

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
                  title: Text('Sem Lactose'),
                  subtitle: Text('Só exibir refeições sem lactose.'),
                  value: settings.isLactoseFree,
                  onChanged: (i) => setState(
                    () => settings.isLactoseFree = i,
                  ),
                ),
                SwitchListTile.adaptive(
                  title: Text('Vegana'),
                  subtitle: Text('Só exibir refeições vegana.'),
                  value: settings.isVegan,
                  onChanged: (i) => setState(
                    () => settings.isVegan = i,
                  ),
                ),
                SwitchListTile.adaptive(
                  title: Text('Sem gluten'),
                  subtitle: Text('Só exibir refeições vegetariana.'),
                  value: settings.isVegetarian,
                  onChanged: (i) => setState(
                    () => settings.isVegetarian = i,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
