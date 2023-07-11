import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/utils/favourites_meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  void onSelecting(int index) {
    setState(() {
      currentIndex = index;
    });
    setState(() {});
  }

  List<Meal> favourets = favoutitesMeals;

  void setScreen(String identifier) {
    if (identifier == 'meals') {
      Navigator.of(context).pop();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedScreen = const CategoriesScreen();
    String currentTitle = 'Categories';
    if (currentIndex == 1) {
      currentTitle = 'My Favourites Meals';
      selectedScreen = MealsScreen(
        meals: favourets,
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
