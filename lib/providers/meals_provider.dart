import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/utils/dummy_data.dart';

final mealsProvider = Provider((ref) => dummyMeals);
