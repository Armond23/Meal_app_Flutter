import 'package:cooking_a_meal/dummy_data.dart';
import 'package:cooking_a_meal/model/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFaveriteMeals;
  final Function isfavorteMeal;

  MealDetailScreen(this.toggleFaveriteMeals, this.isfavorteMeal);

  static const mealDetail = 'Meal_Detail_screen';

  Widget containerText(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: .5, color: Colors.grey)),
      height: 130,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            containerText(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      child: Text(
                        '# ${index + 1}  ${selectedMeal.ingredients[index]}',
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            containerText(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#  ${index + 1} '),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isfavorteMeal(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          toggleFaveriteMeals(mealId);
        },
      ),
    );
  }
}
