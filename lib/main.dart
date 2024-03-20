import 'package:co2509_assignment_movie_app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Shark',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;

  void _updatePage(int newData) {
    setState(() {
      _currentPage = newData;
    });
  }

  final List<Widget> _pages =  [
    HomePage(),
    CategoriesPage(),
    SearchPage(),
    ProfilePage(),
  ];


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(1, 23, 25, 1),
          body: IndexedStack(
            index: _currentPage,
            children: _pages,
          ),
          bottomNavigationBar: Navbar(updatePage: _updatePage,)
      );
    }
  }

