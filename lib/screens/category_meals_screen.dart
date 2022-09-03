import 'package:flutter/material.dart';
import '../widgets/category_meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> categoryMeals = [];
  bool loadInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!loadInitData) {
      final Map<String, dynamic> routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final String categoryId = routeArgs['id'] as String;
      categoryTitle = routeArgs['title'] as String;
      //final Color color = routeArgs['color'] as Color;
      categoryMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      loadInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
              removeItem: _removeMeal,
            );
          }),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
