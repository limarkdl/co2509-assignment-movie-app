import 'package:flutter/material.dart';
import 'package:co2509_assignment_movie_app/models/Movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  MovieTile({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      width: 100,
      child: Column(
        children: [
          Image.network(
            movie.fullPosterUrl,
            height: 225,
            width: 150,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            },
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(movie.title, style: TextStyle(color: Colors.white)),
                Text(movie.year, style: TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}