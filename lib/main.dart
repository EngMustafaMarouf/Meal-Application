import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String,bool> _filtersData)
  {
     setState(() {
       _filters = _filtersData;

       _availableMeals = DUMMY_MEALS.where((meal) {
         if (_filters['gluten'] && !meal.isGlutenFree) return false;
         if (_filters['lactose'] && !meal.isLactoseFree) return false;
         if (_filters['vegan'] && !meal.isVegan) return false;
         if (_filters['vegetarian'] && !meal.isVegetarian) return false;

         return true;

       }).toList();
     });
  }


  void _toggleFavorite(String mealId)
  {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0)
      {
        setState(() {
          _favoriteMeals.removeAt(existingIndex);
        });
      }
    else
      {
        setState(() {
          _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) =>  meal.id == mealId));
        });
      }
  }


  bool _isMealFavorites(String id)
  {
    return _favoriteMeals.any((meal) => meal.id == id);
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 200, 200, 0),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(50, 200, 200, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(50, 200, 200, 1),
          ),
          title: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),


      ),

      debugShowCheckedModeBanner: false,
    //  home: CategoriesScreen(),
      routes: {
        '/':(context)=>TabsScreen(_favoriteMeals),
        CategoryMealScreen.routName:(context)=>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routName:(context)=>MealDetailScreen(_toggleFavorite,_isMealFavorites),
        FiltersScreen.routeName:(context) => FiltersScreen(_filters ,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App part3"),
      ),
      body: null,
    );
  }
}


