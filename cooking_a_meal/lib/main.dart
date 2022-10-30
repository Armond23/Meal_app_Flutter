import 'package:cooking_a_meal/dummy_data.dart';
import 'package:cooking_a_meal/model/meal.dart';
import 'package:cooking_a_meal/screens/category_meal_screen.dart';
import 'package:cooking_a_meal/screens/category_screen.dart';
import 'package:cooking_a_meal/screens/filter_screen.dart';
import 'package:cooking_a_meal/screens/meal_detail_screen.dart';
import 'package:cooking_a_meal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetrain': false,
  };
  List<Meal> __availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      __availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavoriteMeals(String iid) {
    return _favoriteMeals.any((meal) => meal.id == iid);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Ral',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontFamily: 'Rob',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // initialRoute: '/',
      routes: {
        '/': (context) => TabsScreens(_favoriteMeals),
        CategoryMealScreen.catmeal: (cxt) =>
            CategoryMealScreen(__availableMeals),
        MealDetailScreen.mealDetail: (context) =>
            MealDetailScreen(_toggleFavorite, _isFavoriteMeals),
        FilterScreen.filter: (context) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
