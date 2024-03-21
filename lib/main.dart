import 'package:co2509_assignment_movie_app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

// TODO: 'Implement movie page for displaying movie's info'
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: 'Separate this initialization into another directory for TMDB'
    final apiKey = dotenv.env['TMDB_API_KEY'] ?? "default_api_key";
    final apiReadAccessToken = dotenv.env['TMDB_API_READ_ACCESS_TOKEN'] ?? "default_read_access_token";
    return Provider<TMDB>(
      create: (context) => TMDB(
        ApiKeys(apiKey, apiReadAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
      ),
      child: MaterialApp(
        title: 'Movie Shark',
        theme: ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Unbounded',
          ),
          primaryTextTheme: ThemeData.dark().primaryTextTheme.apply(
            fontFamily: 'Unbounded',
          ),

        ),
        home: const MyHomePage(),
      ),
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


  // TODO: 'Extend pages list, add subpages'
  final List<Widget> _pages = [
    HomePage(),
    CategoriesPage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 23, 25, 1),
      body: SafeArea(
        child: IndexedStack(
          index: _currentPage,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Navbar(updatePage: _updatePage,),
    );
  }
}
