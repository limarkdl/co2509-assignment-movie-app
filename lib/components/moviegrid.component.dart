import 'package:flutter/material.dart';

class Movie_Grid extends StatefulWidget {
  const Movie_Grid({super.key});

  @override
  State<Movie_Grid> createState() => _Movie_GridState();
}

class _Movie_GridState extends State<Movie_Grid> {

  static const String _currentMode = 'FOR YOU';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
                height: 15
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12.0),),
                ),
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12.0),)
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
    );
  }
}
