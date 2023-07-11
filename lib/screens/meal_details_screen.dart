import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                    meal.imageUrl,
                  ),
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ' Ingredients: ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    //fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < meal.ingredients.length; i++)
                Container(
                  margin: const EdgeInsets.only(top: 3, right: 5, left: 5),
                  child: Text(
                    ("${i + 1}-  ${meal.ingredients[i]}"),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        //fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' Steps: ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    //fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < meal.steps.length; i++)
                Container(
                  margin: const EdgeInsets.only(top: 3, right: 5, left: 5),
                  child: Text(
                    ("${i + 1}-  ${meal.steps[i]}"),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
