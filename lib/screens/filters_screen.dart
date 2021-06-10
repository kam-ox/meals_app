import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDarawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Center(
        child: Text('Filters Screen'),
      ),
    );
  }
}
