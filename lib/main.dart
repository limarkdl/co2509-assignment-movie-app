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
      theme: ThemeData.dark().copyWith(
        bottomAppBarColor: Color(0xFF011719),
         colorScheme: const ColorScheme.light(
          primary: Color(0xFF011719),
          onPrimary: Colors.white,
          background: Color(0xFF011719),
          surface: Color(0xFF011719),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF011719),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
        ),
      ),
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
  int _currentIndex = 0;
  int _currentIndexForBar = 0;
  // TODO: Remove handlers and create separated handlers for segmental routing

  void _onListBoxTapped(int index) {
    setState(() {
      _currentIndexForBar = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF011719),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 36.0),
            height: 52.0,
            child: () {
              if (_currentIndex == 0) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // TODO: Refactor logic and conditional fontSize. Maybe implement special function for this
                  children:   <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('assets/Logo.png'), width: 36),
                    ),
                    SizedBox(width: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(onTap: () {_onListBoxTapped(0);}, child: Text('FOR YOU', style: TextStyle(fontSize: _currentIndexForBar == 0 ? 24 : 16, color: _currentIndexForBar == 0 ? Colors.white : Colors.white30, fontFamily: 'Unbounded')),),
                    ),
                    SizedBox(width: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(onTap: () {_onListBoxTapped(1);}, child: Text('Watching Now', style: TextStyle(fontSize: _currentIndexForBar == 1 ? 24 : 16, fontFamily: 'Unbounded', color: _currentIndexForBar == 1 ? Colors.white : Colors.white30)),),
                    ),
                    SizedBox(width: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(onTap: () {_onListBoxTapped(2);}, child: Text('New', style: TextStyle(fontSize: _currentIndexForBar == 2 ? 24 : 16, fontFamily: 'Unbounded', color: _currentIndexForBar == 2 ? Colors.white : Colors.white30)),),
                    ),
                    SizedBox(width: 20),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(onTap: () {_onListBoxTapped(3);}, child: Text('TOP-250', style: TextStyle(fontSize: _currentIndexForBar == 3 ? 24 : 16, fontFamily: 'Unbounded', color: _currentIndexForBar == 3 ? Colors.white : Colors.white30)),),
                    ),
                  ],
                );
              } else {
                // TODO: Implement reusable search bar
                return Text('SEARCH BAR');
              }
              } ()
          ),
          Expanded(
            // TODO: 'Remove this war crime and restructure logic. Make new functions and implement all this routing using separated conditions either separated routing library'
            child: Center(
              child: () {
                if (_currentIndex == 0) {
                  if (_currentIndexForBar == 0) {
                    return const Column(
                      children: [
                        Text('Home Page'),
                        Text('FOR YOU')
                      ],
                    );
                  } else if (_currentIndexForBar == 1) {
                    return const Column(
                      children: [
                        Text('Home Page'),
                        Text('Watching Now')
                      ],
                    );
                  } else if (_currentIndexForBar == 2) {
                    return const Column(
                      children: [
                        Text('Home Page'),
                        Text('NEW')
                      ],
                    );
                  } else {
                    return const Column(
                      children: [
                        Text('Home Page'),
                        Text('TOP-250')
                      ],
                    );
                  }
                } else if (_currentIndex == 1){
                  return const Text('Catalogue');
                } else if (_currentIndex == 2){
                  return const Text('Search');
                } else if (_currentIndex == 3){
                  return const Text('Profile');
                } else {
                  throw ErrorDescription('Wrong index for conditional routing');
                }
              } ()
            ),
          ),
        ],
      ),
      // TODO: 'Refactor and create my own Navigation Bar'
      // TODO: 'Use InkWell or GestureHelper for implementing tapping and visualization'
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          elevation: 0,
          iconSize: 36,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:  Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded, size: 28),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded, size: 28),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 28),
              label: '',
            ),
          ],
          currentIndex: _currentIndex,
          // TODO: Remove this handler because using my own navigation bar
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}