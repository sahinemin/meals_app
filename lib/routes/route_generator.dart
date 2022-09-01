import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';

class RouteGenerator {
  static const String categoryPage = "/categories";
  static const String categoryMealPage = "/categoryMeals";
  static const String mealDetailPage = "/mealDetail";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    MaterialPageRoute routeTo(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case categoryPage:
        return routeTo(const CategoriesScreen());
      case categoryMealPage:
        return routeTo(const CategoryMealsScreen());
      case mealDetailPage:
        return routeTo(const MealDetailScreen());
      default:
        return null;
    }
  }
}
