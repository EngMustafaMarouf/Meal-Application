//Note that we stored category in models not widgets ,so
//we don't create here any widgets only classes
import 'package:flutter/material.dart';


class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {@required this.id, @required this.title, this.color = Colors.orange});
}
