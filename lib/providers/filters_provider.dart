import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { gluetenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gluetenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isAztive) {
    state = {...state, filter: isAztive};
  }

  void setFilters(Map<Filter, bool> newFilters) {
    state = newFilters;
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filterMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((element) {
    if (activeFilters[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    if (activeFilters[Filter.gluetenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
