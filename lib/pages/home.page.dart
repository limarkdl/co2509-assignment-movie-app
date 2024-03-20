import 'package:co2509_assignment_movie_app/components/category_bar.component.dart';
import 'package:co2509_assignment_movie_app/skeletons/moviegrid.skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../components/movie_grid.component.dart';
import '../models/Movie.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = 'Trending';
  late TMDB tmdb;


  @override
  void initState() {
    super.initState();
    tmdb = Provider.of<TMDB>(context, listen: false);
  }


  void _updateData(String newData) {
    setState(() {
      _data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 23, 25, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryBar(updateData: _updateData),
          Expanded(
            child: FutureBuilder<Map>(
              future: tmdb.v3.trending.getTrending(page: 1),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Movie_Grid_Skeleton();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  print('RENDERED!');
                  final List results = snapshot.data?['results'] ?? [];
                  final List<Movie> movies = results.map((e) =>
                      Movie.fromJson(e)).toList();
                  return ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MovieGrid(movies: movies),
                        ),
                      ],
                    );
                } else {
                  return const Text('No data');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}