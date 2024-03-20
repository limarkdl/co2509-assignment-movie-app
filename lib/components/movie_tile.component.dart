import 'package:flutter/material.dart';
import 'package:co2509_assignment_movie_app/models/Movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 290,
      width: 100,
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              movie.fullPosterUrl,
              height: 225,
              width: 150,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(movie.title, style: const  TextStyle(color: Colors.white)),
                Text(movie.year, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}