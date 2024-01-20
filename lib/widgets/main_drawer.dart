import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.selectScreen}) : super(key: key);
  final void Function(String id) selectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood_outlined,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Cooking up.. ',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.set_meal),
            title: const Text('Meals'),
            onTap: () {
              selectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Filters'),
            onTap: () {
              selectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
