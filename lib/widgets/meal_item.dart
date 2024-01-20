// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.detailFun,
  });
  final Meal meal;
  final void Function(Meal meal) detailFun;
  String get complexityText {
    switch (meal.complexity) {
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      case Complexity.simple:
        return "Simple";
      default:
        return "Unknown";
    }
  }

  String get affordabiltyText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      case Affordability.pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      margin: const EdgeInsetsDirectional.all(8),
      child: InkWell(
        onTap: () => detailFun(meal),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  color: Colors.black.withOpacity(.7),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 46,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule_outlined),
                            const SizedBox(width: 8),
                            Text('${meal.duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 8),
                            Text(complexityText),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money_outlined),
                            const SizedBox(width: 8),
                            Text(affordabiltyText),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
