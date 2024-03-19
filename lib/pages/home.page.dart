import 'package:co2509_assignment_movie_app/components/categorybar.component.dart';
import 'package:co2509_assignment_movie_app/components/moviegrid.component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = 'FOR YOU';

  void _updateData(String newData) {
    setState(() {
      _data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: CategoryBar(updateData: _updateData),
        ),
        const Expanded(
          child: Movie_Grid()
        ),
      ],
    );

  }
}
