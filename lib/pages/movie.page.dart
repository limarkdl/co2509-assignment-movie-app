import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:co2509_assignment_movie_app/models/Movie.dart';

import '../shared/movie_info_row.dart';
import '../utils/render_country_flags.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late TMDB tmdb;
  late Future<Map<String, dynamic>> _movieDetailsFuture;

  @override
  void initState() {
    super.initState();
    tmdb = Provider.of<TMDB>(context, listen: false);
    _movieDetailsFuture = fetchMovieDetails(widget.movie.id);
  }

  Future<Map<String, dynamic>> fetchMovieDetails(var movieId) async {
    try {
      final details = await tmdb.v3.movies.getDetails(int.parse(movieId));
      return details as Map<String, dynamic>;
    } catch (e) {
      print(e);
      return {};
    }
  }

  
  // TODO: 'Update on pull down'



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 23, 25, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 23, 25, 1),
        title: const Text('Info'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _movieDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No additional data available.'));
          }

          var data = snapshot.data!;
          var budget = data['budget']?.toString() ?? 'N/A';
          var revenue = data['revenue']?.toString() ?? 'N/A';
          var countriesData = data['production_countries'];
          var runTime = data['runtime']?.toString() ?? 'N/A';
          List<String> countriesNames = [];
          List<String> countriesISOs = [];
          if (countriesData != null) {
            countriesNames = List<String>.from(countriesData.map((country) => country['name']));
          }
          print(countriesData);
          print(countriesNames);
          if (countriesData != null) {
            countriesISOs = List<String>.from(countriesData.map((country) => country['iso_3166_1']));
          }
          print(countriesISOs);

          return  ListView(

              children: [Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/loading.png',
                            image: widget.movie.fullPosterUrl,
                            height: 225,
                            width: 150,
                            fit: BoxFit.fill,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, size: 225);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.movie.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '( ${widget.movie.original_title} )',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              MovieInfoRow(name: 'Release', value: widget.movie.normalizedDate),
                              const SizedBox(height: 8),
                              MovieInfoRow(name: 'Rating', value: "${widget.movie.rating} (${widget.movie.vote_count})",),
                              const SizedBox(height: 8),
                              MovieInfoRow(name: 'Budget', value: "$budget\$"),
                              const SizedBox(height: 8),
                              MovieInfoRow(name: 'Revenue', value: "$revenue\$"),
                              const SizedBox(height: 8),
                              MovieInfoRow(name: 'Countries', value: countriesNames.isNotEmpty ? countriesNames.join(', ') : 'N/A'),
                              const SizedBox(height: 8),
                              MovieInfoRow(name: 'Duration', value: '${runTime}min'),
                              const SizedBox(height: 8),
                              Row(
                                children: buildCountryFlags(countriesISOs),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('About:', style: TextStyle(fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.movie.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ]
          );

        },
      ),
    );
  }
}