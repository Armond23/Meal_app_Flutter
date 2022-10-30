import 'package:cooking_a_meal/dummy_data.dart';
import 'package:cooking_a_meal/model/meal.dart';
import 'package:cooking_a_meal/widgets/category_meal.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const catmeal = 'categoryMealScreen';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String? categoryTitle;
  late List<Meal> displayedMela;
  var _loadingMeal = false;

  @override
  void didChangeDependencies() {
    if (!_loadingMeal) {
      final routepage =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routepage['title'];
      final categoryId = routepage['id'];
      displayedMela = widget.availableMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
      _loadingMeal = true;
    }
    super.didChangeDependencies();
  }

  void _removeItmemeal(String mealId) {
    setState(() {
      displayedMela.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (c, i) {
          return CategoryMeals(
            id: displayedMela[i].id,
            title: displayedMela[i].title,
            imageUrl: displayedMela[i].imageUrl,
            duration: displayedMela[i].duration,
            complexity: displayedMela[i].complexity,
            affordability: displayedMela[i].affordability,
          );
        },
        itemCount: displayedMela.length,
      ),
    );
  }
}
