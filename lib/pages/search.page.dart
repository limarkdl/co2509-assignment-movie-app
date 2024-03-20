import 'package:co2509_assignment_movie_app/components/search_asset.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // TODO: 'Make a debounce handler for search requests'

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
            child:  SearchBar(
              hintText: 'Search through millions of movies...',
              leading: Container(
                padding: const EdgeInsets.all(5.0),
                  child: const Icon(TablerIcons.search)
              ),
          ),
        ),
        Expanded(child: SearchAsset())
      ],
    );
  }
}
