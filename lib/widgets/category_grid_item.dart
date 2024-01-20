import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals_screen.dart';

import '../models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {Key? key, required this.category, required this.onToggleFav})
      : super(key: key);
  final Category category;
  final void Function(Meal meal) onToggleFav;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        List<Meal> selectedMeals = dummyMeals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MealsScreen(
                title: category.title,
                meals: selectedMeals,
                onToggleFav: onToggleFav,
              );
            },
          ),
        );
      },
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color,
              category.color.withOpacity(.4),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(category.title,
              style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }
}
