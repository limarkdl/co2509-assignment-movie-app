import 'package:co2509_assignment_movie_app/components/movie_tile.component.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../models/Movie.dart';

class MovieGrid extends StatefulWidget {
  final List<Movie> movies;

  const MovieGrid({super.key, required this.movies});

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: widget.movies.map((movie) {
        return ResponsiveGridCol(
          xs: 6,
          md: 3,
          lg: 2,
          child: MovieTile(movie: movie),
        );
      }).toList(),
    );
  }
}