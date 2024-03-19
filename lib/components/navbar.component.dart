import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key, required this.updatePage});


  final Function(int) updatePage;


  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
    int _currentIndex = 0;

  void _updatePage(int index) {
    setState(() {
      _currentIndex = index;

    });
    widget.updatePage(_currentIndex);
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 32,
      enableFeedback: true,
      backgroundColor: const Color.fromRGBO(3, 51, 56, 1),
      // selectedItemColor: Color.fromRGBO(13, 205, 225, 1),
      selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: const Color.fromRGBO(122, 177, 183, 1),
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
      currentIndex: _currentIndex,
      //New
      onTap: _updatePage,
    );
  }
}
