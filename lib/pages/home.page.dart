import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../components/category_bar.component.dart';
import '../components/movie_grid.component.dart';
import '../models/Movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = 'Now Playing';
  int _currentPage = 1;
  bool _isFetching = false;
  late TMDB tmdb;
  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    tmdb = Provider.of<TMDB>(context, listen: false);
    _scrollController.addListener(_onScroll);
    _fetchData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateData(String newData) {
    if (_data != newData) {
      setState(() {
        _data = newData;
        _movies.clear();
        _currentPage = 1;
        _isFetching = false;
      });
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (_isFetching) return;
    setState(() => _isFetching = true);

    var fetchFunction = _getFetchFunction();
    if (fetchFunction != null) {
      try {
        final results = await fetchFunction;
        final List<Movie> fetchedMovies =
        (results['results'] as List).map((e) => Movie.fromJson(e)).toList();
        setState(() {
          _movies.addAll(fetchedMovies);
          _currentPage++;
        });
        print(results);

      } catch (e) {
        print(e);
      }
    }
    setState(() => _isFetching = false);
  }

  Future<Map<String, dynamic>> _getFetchFunction() {
    Map<String, Future<Map<String, dynamic>> Function()> fetchOptions = {
      'Now Playing': () async {
        var result = await tmdb.v3.movies.getNowPlaying(page: _currentPage);
        return result as Map<String, dynamic>;
      },
      'Popular': () async {
        var result = await tmdb.v3.movies.getPopular(page: _currentPage);
        return result as Map<String, dynamic>;
      },
      'Top Rated': () async {
        var result = await tmdb.v3.movies.getTopRated(page: _currentPage);
        return result as Map<String, dynamic>;
      },
      'Upcoming': () async {
        var result = await tmdb.v3.movies.getUpcoming(page: _currentPage);
        return result as Map<String, dynamic>;
      },
    };

    var fetchFunction = fetchOptions[_data];
    if (fetchFunction != null) {
      return fetchFunction();
    } else {
      return Future.value({});
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchData();
    }
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
            child: _movies.isEmpty && _isFetching
                ? const Center(
              child: CircularProgressIndicator()
            )
                : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MovieGrid(movies: _movies),
                  ),
                  if (_isFetching)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}