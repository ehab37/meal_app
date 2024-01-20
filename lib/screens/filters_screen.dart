import 'package:flutter/material.dart';
import 'package:meal_app/screens/tab_screen.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gloten = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        selectScreen: (value) {
          if (value == 'meals') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const TabScreen();
                },
              ),
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        children: [
          CustomSwitch(
            value: _gloten,
            title: 'Gluten-Free',
            onChanged: (bool value) {
              setState(() {
                _gloten = value;
              });
            },
          ),
          CustomSwitch(
            value: _vegan,
            title: 'Vegan',
            onChanged: (bool value) {
              setState(() {
                _vegan = value;
              });
            },
          ),
          CustomSwitch(
            value: _vegetarian,
            title: 'Vegetarian',
            onChanged: (bool value) {
              setState(() {
                _vegetarian = value;
              });
            },
          ),
          CustomSwitch(
            value: _lactoseFree,
            title: 'Lactose-Free',
            onChanged: (bool value) {
              setState(() {
                _lactoseFree = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.title,
    required this.onChanged,
    required this.value,
  });
  final String title;
  final void Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
