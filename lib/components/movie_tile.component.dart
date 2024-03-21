import 'package:flutter/material.dart';
import 'package:co2509_assignment_movie_app/models/Movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  Color _ratingColor(double rating) {
    if (rating < 4) {
      return Colors.red;
    } else if (rating >= 4 && rating < 6.5) {
      return Colors.yellow.shade900;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double rating = double.parse(movie.rating);
    return SizedBox(
      height: 290,
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      print(movie.id);
                    },
                    child: Ink.image(
                      image: NetworkImage(movie.fullPosterUrl),
                      height: 225,
                      width: 150,
                      fit: BoxFit.fill,
                      child: Container(),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  color: Colors.black87,
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.year, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(movie.rating, style: TextStyle(color: _ratingColor(rating), fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}