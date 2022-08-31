import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: mediaQuery.size.width / 10,
          maxCrossAxisExtent: mediaQuery.size.height / 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: mediaQuery.size.width / 100,
          mainAxisSpacing: mediaQuery.size.width / 100,
        ),
        children: <Widget>[
          ...dummyCategories
              .map((e) => CategoryItem(
                    id: e.id,
                    title: e.title,
                    color: e.color,
                  ))
              .toList()
        ],
      ),
    );
  }
}
