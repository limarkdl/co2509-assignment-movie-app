import 'package:co2509_assignment_movie_app/models/Category.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'movie_tile.component.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key, required this.categories});
  final List<Category> categories;

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: widget.categories.map((category) {
        return ResponsiveGridCol(
          xs: 6,
          md: 3,
          lg: 2,
          child: Text('test')
        );
      }).toList(),
    );
  }
}
