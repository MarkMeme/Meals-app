import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    _animationController.forward();
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.bounceInOut)),
        child: child,
      ),
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.landscape ? 4 : 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in dummyCategories)
            CategoryGridItem(
              category: category,
              availableMeals: widget.availableMeals,
            )
        ],
      ),
    );
  }
}
