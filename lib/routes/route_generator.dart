import 'package:flutter/material.dart';
import '../widgets/category_meals_screen.dart';
import '../widgets/categories_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/categories':
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case '/categoryMeals':
        return MaterialPageRoute(
            builder: (_) => const CategoryMealsScreen(), settings: settings);
      default:
        return null;
    }
  }
}
