import 'package:flutter/material.dart';

class SearchAsset extends StatelessWidget {
  const SearchAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('assets/search_page.png'), width: double.infinity, height: 500, fit: BoxFit.fitHeight,);
  }
}


