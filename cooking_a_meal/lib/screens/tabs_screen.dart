import 'dart:math';

import 'package:cooking_a_meal/model/meal.dart';
import 'package:cooking_a_meal/screens/category_meal_screen.dart';
import 'package:cooking_a_meal/screens/category_screen.dart';
import 'package:cooking_a_meal/screens/favorite_screen.dart';
import 'package:cooking_a_meal/widgets/drawer_option.dart';
import 'package:flutter/material.dart';

class TabsScreens extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreens(this.favoriteMeals);

  @override
  State<TabsScreens> createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  late List<Map> _pages;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ];

    super.initState();
  }

  int selectedIndex = 0;
  void selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedIndex]['title']),
      ),
      drawer: DrawerOption(),
      body: _pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedIndex,
        onTap: selectedTab,
        items: [
          BottomNavigationBarItem(
              label: 'Categories', icon: Icon(Icons.category)),
          BottomNavigationBarItem(
              label: 'Favorites', icon: Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
