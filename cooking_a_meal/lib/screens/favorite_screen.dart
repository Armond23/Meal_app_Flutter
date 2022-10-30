import 'package:cooking_a_meal/model/meal.dart';
import 'package:cooking_a_meal/widgets/category_meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('you have no favorites yet - start adding some !'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (c, i) {
          return CategoryMeals(
            id: favoriteMeals[i].id,
            title: favoriteMeals[i].title,
            imageUrl: favoriteMeals[i].imageUrl,
            duration: favoriteMeals[i].duration,
            complexity: favoriteMeals[i].complexity,
            affordability: favoriteMeals[i].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
