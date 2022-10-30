import 'package:cooking_a_meal/widgets/category_itme.dart';
import 'package:cooking_a_meal/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('DeliMeal'),
      // ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(20),
          children: DUMMY_CATEGORIES
              .map(
                (catData) =>
                    CategoryIteme(catData.title, catData.color, catData.id),
              )
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
