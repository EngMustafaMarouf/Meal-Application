import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);



  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>> _pages ;


  @override
  void initState()
  {
    //not that i used initstate to can use widget.favoriteMeals
    _pages = [
      {
        'page':CategoriesScreen(),
        'title':"Categories",
      },
      {
        'page':FavoritesScreen(widget.favoriteMeals),
        'title':"your Favorites",
      }

    ];

    super.initState();
  }

  int selectPageIndex = 0;
  void _selectPage(int value) {
    setState(() {
      selectPageIndex = value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectPageIndex]['title']),
      ),
      body: _pages[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Category")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favorites")),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
