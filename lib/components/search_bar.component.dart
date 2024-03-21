import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

// TODO: 'Implement searching algorithm'
// TODO: 'Implement debouncer'
class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return const Text('Search bar');
  }
}
