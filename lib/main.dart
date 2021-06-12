import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFiltersData(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orange.shade600,
        canvasColor:
            Color.fromRGBO(255, 254, 229, 1), //TODO google what is this
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              //TODO google what is this
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(), /*MyHomePage(),*/ //* defines root screen of an app
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) =>
            TabsScreen(_favoriteMeals), // home by default uses '/' route
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            _availableMeals), //* здесь добавлять все route'ы к которым можно переходить и которые соответственно имеют routeName
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(_filters, _setFiltersData),
      },
      // onGenerateRoute: (settings) {
      //   //* если route не установлен в routes, то загрузится этот route. ! rarely used
      //   print(settings.arguments);
      //return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        //TODO можно сделать типо 404 ошибки если не существет route, куда человек пытался зайти
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
