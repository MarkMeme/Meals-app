import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/utils/dummy_data.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, super.key});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var showedMeals = dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MealsScreen(meals: showedMeals, title: category.title),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                category.categoryColor.withOpacity(0.45),
                category.categoryColor.withOpacity(1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Center(
          child: Text(
            (category.title),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
