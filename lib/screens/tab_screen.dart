import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> favMeals = [];
  void toggleFav(Meal meal) {
    if (favMeals.contains(meal)) {
      setState(() {
        favMeals.remove(meal);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${meal.title} removed from favorites',
          ),
        ),
      );
    } else {
      setState(() {
        favMeals.add(meal);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${meal.title} added to favorites',
          ),
        ),
      );
    }
  }

  void _selectScreen(String value) {
    if (value == 'filters') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const FiltersScreen();
      }));
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(
        selectScreen: _selectScreen,
      ),
      body: _selectedPageIndex == 0
          ? Categories(
              onToggleFav: toggleFav,
            )
          : MealsScreen(
              title: 'Favorite',
              meals: favMeals,
              onToggleFav: toggleFav,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
