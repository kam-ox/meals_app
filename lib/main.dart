import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

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
        '/': (ctx) => CategoriesScreen(), // home by default uses '/' route
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}

/*class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}*/
