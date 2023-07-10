import 'package:flutter/material.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(dummyCategories[1].title);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite Meals"),
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in dummyCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}
