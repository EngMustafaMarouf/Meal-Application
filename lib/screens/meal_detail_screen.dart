import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  final Function toggleFavorites;
  final Function isFavorites;

  MealDetailScreen(this.toggleFavorites, this.isFavorites);


  Widget buildSection(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: Theme
            .of(context)
            .textTheme
            .title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  static const routName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSection(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) =>
                    Card(
                      //not that when i use lambda expression , I don't need to put a return keyword
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSection(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) =>
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(), // to draw a line after each step
                      ],
                    ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> toggleFavorites(mealId),
        child: Icon(
            isFavorites(mealId) ? Icons.star : Icons.star_border,
        ),


      ),
    );
  }
}
