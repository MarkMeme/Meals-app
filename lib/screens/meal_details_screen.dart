import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreen();
}

class _MealDetailsScreen extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.meal.title,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(widget.meal);
                //added = wasAdded;
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded == true
                        ? "${widget.meal.title} is added to Favorites"
                        : "${widget.meal.title} is removed from Favorites")));
                setState(() {});
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.8, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: widget.meal.isFavourte == false
                    ? Icon(
                        Icons.star_border_outlined,
                        color: const Color.fromARGB(255, 253, 191, 4),
                        key: ValueKey(widget.meal.isFavourte),
                      )
                    : const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 253, 191, 4),
                      ),
              ))
        ],
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
                child: Hero(
                  tag: widget.meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                      widget.meal.imageUrl,
                    ),
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
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
              for (int i = 0; i < widget.meal.ingredients.length; i++)
                Container(
                  margin: const EdgeInsets.only(top: 3, right: 5, left: 5),
                  child: Text(
                    ("${i + 1}-  ${widget.meal.ingredients[i]}"),
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
              for (int i = 0; i < widget.meal.steps.length; i++)
                Container(
                  margin: const EdgeInsets.only(top: 3, right: 5, left: 5),
                  child: Text(
                    ("${i + 1}-  ${widget.meal.steps[i]}"),
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
