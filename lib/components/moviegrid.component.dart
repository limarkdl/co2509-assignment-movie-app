import 'package:co2509_assignment_movie_app/components/moviegrid.tile.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Movie_Grid extends StatefulWidget {
  const Movie_Grid({super.key});

  @override
  State<Movie_Grid> createState() => _Movie_GridState();
}

class _Movie_GridState extends State<Movie_Grid> {


   String _currentMode = 'FOR YOU';

   void _updateMode(String newMode) {
     setState(() {
       _currentMode = newMode;
     });
   }

   List<StaggeredGridTile> items =  [
     StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),
     StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),
     StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),StaggeredGridTile.count(
       crossAxisCellCount: 1,
       mainAxisCellCount: 1,
       child: MovieTile(title: 'TED', rating: 10),
     ),

   ];


  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          child:
          StaggeredGrid.count(
            crossAxisCount:(MediaQuery.of(context).size.width ~/ 150).toInt(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          children: items,
        ))
    );
  }
}
