import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {Key? key,
      required this.title,
      required this.meals,
      required this.onToggleFav})
      : super(key: key);
  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: meals
              .map((meal) => MealItem(
                    meal: meal,
                    detailFun: (meal) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return MealDetailScreen(
                            onToggleFav: onToggleFav,
                            meal: meal,
                          );
                        }),
                      );
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
