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
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/Logo.png'), width: 36,),
                ),
                SizedBox(width: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text('FOR YOU', style: TextStyle(fontSize: 24, fontFamily: 'Unbounded'),),
                ),
                SizedBox(width: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text('Watching Now', style: TextStyle(fontSize: 16, fontFamily: 'Unbounded', color: Colors.white30),),
                ),
                SizedBox(width: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text('New', style: TextStyle(fontSize: 16, fontFamily: 'Unbounded', color: Colors.white30),),
                ),
                SizedBox(width: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text('TOP-250', style: TextStyle(fontSize: 16, fontFamily: 'Unbounded', color: Colors.white30),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'PAGE #$_currentIndex',
                style: const TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Unbounded'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: _onItemTapped,
      ),
    );
  }
}