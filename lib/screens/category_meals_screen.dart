import 'package:flutter/material.dart';
import '../widgets/category_meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String categoryId = routeArgs['id'] as String;
    final String categoryTitle = routeArgs['title'] as String;
    final Color color = routeArgs['color'] as Color;
    final List<Meal> categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          }),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
