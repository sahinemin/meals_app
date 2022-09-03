import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/category_meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  const FavoritesScreen({super.key, required this.favoritedMeals});

  @override
  Widget build(BuildContext context) {
    return favoritedMeals.isEmpty
        ? const Center(
            child: Text('You have no favorites yet'),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return MealItem(
                id: favoritedMeals[index].id,
                title: favoritedMeals[index].title,
                imageUrl: favoritedMeals[index].imageUrl,
                duration: favoritedMeals[index].duration,
                complexity: favoritedMeals[index].complexity,
                affordability: favoritedMeals[index].affordability,
                removeItem: () {},
              );
            }),
            itemCount: favoritedMeals.length,
          );
  }
}
