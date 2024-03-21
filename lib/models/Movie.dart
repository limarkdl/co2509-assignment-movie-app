import 'package:intl/intl.dart';

class Movie {
  final String title;
  final String releaseDate;
  final String posterPath;
  final String rating;
  final String id;
  final String original_title;
  final String vote_count;

  final String overview;


  Movie({
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.rating,
    required this.overview,
    required this.id,
    required this.vote_count,
    required this.original_title
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    String correctedPosterPath = json['poster_path'] ?? json['backdrop_path'];
    correctedPosterPath.toString();

    double voteAverage = json['vote_average'].toDouble();
    String correctedRating = voteAverage.toStringAsFixed(1);


    // TODO: 'Make sure that it's safe and not-nullable'
    return Movie(
        title: json['title'] ?? json['name'],
        releaseDate: json['release_date'] ?? json['first_air_date'],
        posterPath: correctedPosterPath,
        rating: correctedRating ?? 'N/A',
        id: json['id'].toString(),
        overview: json['overview'].toString(),
        original_title: json['original_title'],
        vote_count: json['vote_count'].toString()
    );
  }

  String get normalizedDate {
    DateTime date = DateTime.parse(releaseDate);
    DateFormat dateFormat = DateFormat('d MMMM, y');
    String formattedDate = dateFormat.format(date);
    return formattedDate;
  }

  double get doubleRating => double.parse(rating);

  String get year => releaseDate.split('-').first;

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}