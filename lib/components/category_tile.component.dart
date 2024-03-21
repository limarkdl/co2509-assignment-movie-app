import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.title, required this.url_to_bg});
  final String title;
  final String url_to_bg;

  @override
  Widget build(BuildContext context) {
    return const Text('Category tile');
  }
}
