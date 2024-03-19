import 'package:co2509_assignment_movie_app/components/navbar.component.dart';
import 'package:co2509_assignment_movie_app/pages/categories.page.dart';
import 'package:co2509_assignment_movie_app/pages/home.page.dart';
import 'package:co2509_assignment_movie_app/pages/profile.page.dart';
import 'package:co2509_assignment_movie_app/pages/search.page.dart';
import 'package:flutter/material.dart';

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


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(1, 23, 25, 1),
          body:
          Center(
              child: () {
                if (_currentPage == 0) {
                  return const HomePage();
                } else if (_currentPage == 1) {
                  return const CategoriesPage();
                } else if (_currentPage == 2) {
                  return const SearchPage();
                } else if (_currentPage == 3) {
                  return const ProfilePage();
                } else {
                  throw ErrorDescription('Wrong index for conditional routing');
                }
              }()
          ),
          bottomNavigationBar: Navbar(updatePage: _updatePage,)

      );
    }
  }

