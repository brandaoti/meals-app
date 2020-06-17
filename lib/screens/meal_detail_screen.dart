import 'package:flutter/material.dart';

import '../model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  //

  //final sizeBox = SizedBox(height: 20);

  // Widget create section title
  Widget _createSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Text(
        title,
        //TODO: Verificar se vai usar o style pelo Material App
        style: TextStyle(fontFamily: 'Kreon', fontSize: 20),
      ),
    );
  }

  // Widget create section Container
  Widget _createSectionContainer(Widget child) {
    return Container(
      height: 200,
      width: 350,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    // Implements screen for meal detail
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              //color: Colors.red,
              shadowColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    //color: Colors.red,
                    height: 250,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        meal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Instanciando Container patronizado "Ingredients"
            //sizeBox,
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 2,
                    color: Colors.orangeAccent,
                    //shadowColor: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(fontFamily: 'Kreon'),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Instanciando Container patronizado "STEPS"
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(
                        meal.steps[index],
                        style: TextStyle(fontFamily: 'Kreon', fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // TODO: add um FloatButton, responsavel pela por marcar como favorito
    );
  }
}
