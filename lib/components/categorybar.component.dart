import 'package:flutter/material.dart';

import 'logo.component.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key});



  @override
  State<CategoryBar> createState() => _CategoryBarState();


}

class _CategoryBarState extends State<CategoryBar> {

 int _currentIndexForBar = 0;

 void _onListBoxTapped(int index) {
   setState(() {
     _currentIndexForBar = index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children:   <Widget>[
        const Align(
            alignment: Alignment.center,
            child: Logo()
        ),
        SizedBox(width: 20),
        Align(
          alignment: Alignment.center,
          child:
          InkWell(
            onTap: () {
              _onListBoxTapped(0);
              },
            child: Text(
                'FOR YOU',
                style: TextStyle(
                    fontSize: _currentIndexForBar == 0 ? 24 : 16,
                    color: _currentIndexForBar == 0 ? Colors.white : Colors.white30,
                    fontFamily: 'Unbounded')
            ),
          ),
        ),
        SizedBox(width: 20),
        Align(
          alignment: Alignment.center,
          child:
          InkWell(
            onTap: () {
              _onListBoxTapped(1);
              },
            child: Text(
                'Watching Now',
                style: TextStyle(
                    fontSize: _currentIndexForBar == 1 ? 24 : 16,
                    fontFamily: 'Unbounded',
                    color: _currentIndexForBar == 1 ? Colors.white : Colors.white30)
            ),
          ),
        ),
        SizedBox(width: 20),
        Align(
          alignment: Alignment.center,
          child:
          InkWell(
            onTap: () {
              _onListBoxTapped(2);
              },
            child: Text(
                'New',
                style: TextStyle(
                    fontSize: _currentIndexForBar == 2 ? 24 : 16,
                    fontFamily: 'Unbounded',
                    color: _currentIndexForBar == 2 ? Colors.white : Colors.white30)
            ),
          ),
        ),
        SizedBox(width: 20),
        Align(
          alignment: Alignment.center,
          child:
          InkWell(onTap: () {
            _onListBoxTapped(3);
            },
            child: Text(
                'TOP-250',
                style: TextStyle(
                    fontSize: _currentIndexForBar == 3 ? 24 : 16,
                    fontFamily: 'Unbounded',
                    color: _currentIndexForBar == 3 ? Colors.white : Colors.white30)
            ),
          ),
        ),
      ],
    );
  }
}

