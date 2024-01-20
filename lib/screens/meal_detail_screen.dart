// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key? key,
    required this.meal,
    required this.onToggleFav,
  }) : super(key: key);
  final Meal meal;
  final void Function(Meal meal) onToggleFav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFav(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(16),
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'ingredients',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            for (String ele in meal.ingredients) Text(ele),
            const SizedBox(
              height: 20,
            ),
            Text(
              'steps',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            for (String ele in meal.steps)
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  ele,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
