import 'package:flutter/material.dart';

class MovieInfoRow extends StatelessWidget {
  MovieInfoRow({super.key, required this.name, required this.value});

  late String value;
  late String name;

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(
          name,
          style:  const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            overflow: TextOverflow.ellipsis
          ),
        ),
      ],
    );
  }
}
