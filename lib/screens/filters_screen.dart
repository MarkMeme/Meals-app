import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
            Filter.gluetenFree: activeFilters[Filter.gluetenFree]!,
            Filter.lactoseFree: activeFilters[Filter.lactoseFree]!,
            Filter.vegetarian: activeFilters[Filter.vegetarian]!,
            Filter.vegan: activeFilters[Filter.vegan]!,
          });
          //Navigator.of(context).pop();
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.gluetenFree]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.gluetenFree, value);
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only includes gluten-free meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Colors.white,
              activeTrackColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.lactoseFree, value);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Colors.white,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              //contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegetarian, value);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Colors.white,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              //contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (value) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegan, value);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Colors.white,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              //contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
