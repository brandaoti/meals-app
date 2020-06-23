import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

import '../model/settings.dart';

class SettingsScreen extends StatefulWidget {
  // Responsavel por salvar o estado das configurações
  final Settings settings;

  // Função pra ativar as configurações
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Responsavel por pegar os atributos de settings()
  var settings = Settings();

  // Método pra sobreescrever os dados e salvar as configurações.
  void initState() {
    super.initState();
    settings = widget.settings;
  }

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
                // Instanciando configurações personalizavel
                _createSwitch(
                  'Sem glúten',
                  'Só exibir refeições sem glúten',
                  settings.isGluttenFree,
                  (newValue) => setState(
                    () => settings.isGluttenFree = newValue,
                  ),
                ),

                _createSwitch(
                  'Sem lactose',
                  'Só exibir refeições sem lactose',
                  settings.isLactoseFree,
                  (newValue) => setState(
                    () => settings.isLactoseFree = newValue,
                  ),
                ),
                _createSwitch(
                  'Refeições vegana',
                  'Só exibir refeições vegana',
                  settings.isVegan,
                  (newValue) => setState(
                    () => settings.isVegan = newValue,
                  ),
                ),
                _createSwitch(
                  'Refeições vegetariana',
                  'Só exibir refeições vegeratiana',
                  settings.isVegetarian,
                  (newValue) => setState(
                    () => settings.isVegetarian = newValue,
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
