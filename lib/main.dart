import 'package:co2509_assignment_movie_app/components/categorybar.component.dart';
import 'package:co2509_assignment_movie_app/components/navbar.component.dart';
import 'package:co2509_assignment_movie_app/pages/categories.page.dart';
import 'package:co2509_assignment_movie_app/pages/home.page.dart';
import 'package:co2509_assignment_movie_app/pages/profile.page.dart';
import 'package:co2509_assignment_movie_app/pages/search.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(1, 23, 25, 1),
          body:
          Center(
              child: () {
                if (_selectedIndex == 0) {
                  return const HomePage();
                } else if (_selectedIndex == 1) {
                  return const CategoriesPage();
                } else if (_selectedIndex == 2) {
                  return const SearchPage();
                } else if (_selectedIndex == 3) {
                  return const ProfilePage();
                } else {
                  throw ErrorDescription('Wrong index for conditional routing');
                }
              }()
          ),
          bottomNavigationBar:
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 32,
            backgroundColor: Color.fromRGBO(3, 51, 56, 1),
            // selectedItemColor: Color.fromRGBO(13, 205, 225, 1),
            selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
            unselectedItemColor: Color.fromRGBO(122, 177, 183, 1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(3, 51, 56, 1),
                icon: Icon(TablerIcons.home_2),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(3, 51, 56, 1),

                icon: Icon(TablerIcons.category_2),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(3, 51, 56, 1),
                icon: Icon(TablerIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(3, 51, 56, 1),

                icon: Icon(TablerIcons.user),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            //New
            onTap: _onItemTapped,
          ));
    }
  }

