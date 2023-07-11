import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/favourites_meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
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
                widget.meal.isFavourte = !widget.meal.isFavourte;
                if (!favoutitesMeals.contains(widget.meal)) {
                  setState(() {
                    favoutitesMeals.add(widget.meal);
                  });
                } else {
                  setState(() {
                    favoutitesMeals.remove(widget.meal);
                  });
                }
                //setState(() {});
                print(favoutitesMeals.length);
                print(widget.meal.isFavourte);
              },
              icon: widget.meal.isFavourte == false
                  ? const Icon(
                      Icons.star_border_outlined,
                      color: Color.fromARGB(255, 253, 191, 4),
                    )
                  : const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 253, 191, 4),
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
