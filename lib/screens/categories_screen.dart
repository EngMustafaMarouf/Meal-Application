import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(15),
        //convert Dummy categories from list of objects to list of widgets
        children:DUMMY_CATEGORIES.map((catData) =>
        CategoryItem(catData.id,catData.title,catData.color),

        ).toList(),
        //to control grid setting
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,


        ),
      ),
    );
  }
}
