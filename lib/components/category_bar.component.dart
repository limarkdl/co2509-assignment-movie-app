import 'package:flutter/material.dart';
import 'logo.component.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key, required this.updateData});

  final Function(String) updateData;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int _currentIndexForBar = 0;
  final List<String> categoryNames = ['Now Playing', 'Popular', 'Top Rated', 'Upcoming'];

  void _onListBoxTapped(int index) {
    setState(() {
      _currentIndexForBar = index;
    });
    widget.updateData(categoryNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)),
      ),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Logo(),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryNames.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => _onListBoxTapped(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        categoryNames[index],
                        style: TextStyle(
                          fontSize: _currentIndexForBar == index ? 24 : 16,
                          fontFamily: 'Unbounded',
                          color: _currentIndexForBar == index ? Colors.white : Colors.white30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}