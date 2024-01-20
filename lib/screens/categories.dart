import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

import '../models/meal.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.onToggleFav}) : super(key: key);
  final void Function(Meal meal) onToggleFav;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('categories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2,
            ),
            children: [
              for (final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  onToggleFav: onToggleFav,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
