import 'package:cooking_a_meal/screens/category_meal_screen.dart';
import "package:flutter/material.dart";

class CategoryIteme extends StatelessWidget {
  String title;
  Color color;
  String id;
  CategoryIteme(this.title, this.color, this.id);
  void selectedCategortIteme(BuildContext ctx) {
    Navigator.pushNamed(
      ctx,
      CategoryMealScreen.catmeal,
      arguments: {'title': title, 'id': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategortIteme(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
