import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    //* going to the next screen
    Navigator.of(ctx).pushNamed(
        //* there are different methods instead of push
        CategoryMealsScreen
            .routeName, // * выбирает куда идти при помощи названия route экрана (screen'а)
        arguments: {
          'id': id,
          'title': title,
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), //! should match with border radius below (in container), for coolness
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        //color: color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // * gradient
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
