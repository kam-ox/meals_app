import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({ //const for setting that values cant change
    @required this.id, //* обязательно иметь id
    @required this.title, //* обязательно иметь название
    this.color = Colors.orange, //* default value
  });
}
