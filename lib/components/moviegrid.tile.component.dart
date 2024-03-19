import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
   MovieTile({required this.title, required this.rating});
   final String title;
   final int rating;

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/TED_poster.png'));
  }
}
