// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// import '../components/movie_grid.component.dart';
// import '../models/Movie.dart';
//
// class Movie_Grid_Skeleton extends StatelessWidget {
//    Movie_Grid_Skeleton({super.key});
//
//   List<Movie> fooMovies = [
//     Movie(title: 'Test',posterPath: '', releaseDate: '2002'),
//     Movie(title: 'Test',posterPath: '', releaseDate: '2002'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: true,
//       child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: MovieGrid(movies: fooMovies),
//           ),
//         ],
//       ),
//     );
//   }
// }
