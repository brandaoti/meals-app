import 'package:flutter/material.dart';

import '../model/meal.dart';

class CategoryMealItem extends StatelessWidget {
  //Instancia da classe
  final Meal meal;

  //Construtor
  const CategoryMealItem(this.meal);

  // TODO: Criar método pra navegar para tela com os detalhes da Meal

  @override
  Widget build(BuildContext context) {
    //TODO: add um InkWell e ativar onTap, chamando a função
    return Card(
      elevation: 5,
      shadowColor: Colors.red,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                // Responsavel por gerar as imagens das refeições
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              //TODO: Add o Positioned, pra exibir uma msg
              Positioned(
                //
                left: 10,
                right: 10,
                bottom: 20,

                child: Container(
                  color: Colors.black45,
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text(
                    meal.title,

                    // TODO: Add o estilo do MaterialApp
                    style: TextStyle(
                      fontFamily: 'Kreon',
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          // Linha responsavel por exibir tempo, trabalho e preço
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.timer),
                    Text('${meal.duration} min'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    Text('${meal.complexityText}'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    Text('${meal.costText}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
