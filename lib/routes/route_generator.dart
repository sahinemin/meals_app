import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import '../models/meal.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';

Map<String, bool> filters = {
  'gluten': false,
  'lactose': false,
  'vegan': false,
  'vegetarian': false
};
List<Meal> availableMeals = dummyMeals;
List<Meal> favoritedMeals = [];

class RouteGenerator {
  static const String categoryPage = "/categories";
  static const String categoryMealPage = "/categoryMeals";
  static const String mealDetailPage = "/mealDetail";
  static const String tabsPage = "/tabs";
  static const String filterPage = '/filters';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    setFilters(Map<String, bool> filterData) {
      availableMeals = dummyMeals;
      filters = filterData;
      availableMeals = availableMeals.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) return false;
        if (filters['lactose']! && !meal.isLactoseFree) return false;
        if (filters['vegan']! && !meal.isVegan) return false;
        if (filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    }

    toggleFavorite(String mealId) {
      final existingIndex =
          favoritedMeals.indexWhere((meal) => meal.id == mealId);
      if (existingIndex >= 0) {
        favoritedMeals.removeAt(existingIndex);
      } else {
        favoritedMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      }
    }

    MaterialPageRoute routeTo(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case categoryPage:
        return routeTo(const CategoriesScreen());
      case categoryMealPage:
        return routeTo(CategoryMealsScreen(availableMeals: availableMeals));
      case mealDetailPage:
        return routeTo(MealDetailScreen(toggleFavorite: toggleFavorite));
      case tabsPage:
        return routeTo(TabsScreen(favoritedMeals: favoritedMeals));
      case filterPage:
        return routeTo(
            FiltersScreen(filters: filters, saveFilters: setFilters));
      default:
        return null;
    }
  }
}
