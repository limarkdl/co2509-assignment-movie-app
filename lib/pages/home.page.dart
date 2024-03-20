import 'package:co2509_assignment_movie_app/components/category_bar.component.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../components/movie_grid.component.dart';
import '../models/Movie.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = 'FOR YOU';
  late final TMDB tmdbWithCustomLogs;

  @override
  void initState() {
    super.initState();
    tmdbWithCustomLogs = TMDB(
      ApiKeys('API_KEY', 'your_api_read_access_token'),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
  }


  void _updateData(String newData) {
    setState(() {
      _data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryBar(updateData: _updateData),
          Expanded(
            child: FutureBuilder<Map>(
              future: tmdbWithCustomLogs.v3.trending.getTrending(page: 1, timeWindow: TimeWindow.day),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
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