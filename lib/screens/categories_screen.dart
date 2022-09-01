import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: size.width / 10,
          maxCrossAxisExtent: size.height / 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: size.width / 100,
          mainAxisSpacing: size.width / 100,
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
