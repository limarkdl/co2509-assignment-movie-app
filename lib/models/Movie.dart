class Movie {
  final String title;
  final String releaseDate;
  final String posterPath;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? json['name'],
      releaseDate: json['release_date'] ?? json['first_air_date'],
      posterPath: json['poster_path'] ?? '',
    );
  }

  String get year => releaseDate.split('-').first;

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}