import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
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
        '/': (ctx) => TabsScreen(), // home by default uses '/' route
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(), //* здесь добавлять все route'ы к которым можно переходить и которые соответственно имеют routeName
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
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
