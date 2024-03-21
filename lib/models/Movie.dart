class Movie {
  final String title;
  final String releaseDate;
  final String posterPath;
  final String rating;
  final String id;


  Movie({
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.rating,
    required this.id
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
        id: json['id'].toString()
    );
  }

  String get year => releaseDate.split('-').first;

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}