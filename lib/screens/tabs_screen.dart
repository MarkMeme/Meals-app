import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  Widget selectedScreen = const CategoriesScreen();
  String currentTitle = 'Categorirs';

  void onSelecting(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 1) {
      currentTitle = 'My Favourites Meals';
      selectedScreen = MealsScreen(
        meals: [],
        title: currentTitle,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
      ),
      body: selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => onSelecting(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal, size: 25), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 25,
              ),
              label: 'Categories')
        ],
      ),
    );
  }
}
