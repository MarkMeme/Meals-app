import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

Map<Filter, bool> kSelectedFilters = {
  Filter.gluetenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int currentIndex = 0;
  void onSelecting(int index) {
    setState(() {
      currentIndex = index;
    });
    setState(() {});
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'meals') {
    } else {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => FiltersScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filterMealProvider);
    Widget selectedScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    String currentTitle = 'Categories';
    if (currentIndex == 1) {
      currentTitle = 'My Favourites Meals';
      selectedScreen = MealsScreen(
        meals: favoriteMeals,
      );
    }
    return Scaffold(
      drawer: MainDrawer(onSetScreen: setScreen),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          currentTitle,
        ),
      ),
      body: selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (index) => onSelecting(index),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal, size: 25), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 25,
              ),
              label: 'Favourites')
        ],
      ),
    );
  }
}
