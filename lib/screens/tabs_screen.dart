import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      //! or just use List<Widget> if don't want to make additional changes
      //* List of tabs pages
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      }
    ];
  }

  int _selectedPageIndex = 0; //* needs to change screen via selected index

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index; //* changes selected index when onTap executes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, //* changing selected index. index is passed automatically by flutter, so don't need to add it manually
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 15,
        //type: BottomNavigationBarType.shifting, kinda animation

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
