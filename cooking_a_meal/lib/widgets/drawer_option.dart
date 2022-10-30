import 'package:cooking_a_meal/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption({Key? key}) : super(key: key);

  Widget optionsDrawers(IconData icon, String title, Function filtersFunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Rob',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        filtersFunction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 120,
            color: Theme.of(context).accentColor,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          optionsDrawers(
            Icons.restaurant_outlined,
            'Meals',
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          optionsDrawers(
            Icons.settings,
            'Filters',
            () {
              Navigator.pushReplacementNamed(
                context,
                FilterScreen.filter,
              );
            },
          ),
        ],
      ),
    );
  }
}
