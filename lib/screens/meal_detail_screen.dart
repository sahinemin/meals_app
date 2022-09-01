import 'package:flutter/material.dart';
import 'package:meals_app/routes/route_generator.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});
  static const routeName = RouteGenerator.mealDetailPage;

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text('The meal - $mealId!'),
      ),
    );
  }
}
