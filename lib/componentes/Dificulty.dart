import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificultyLevel;
  
  const Difficulty({
      required this.dificultyLevel,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (dificultyLevel >= 1) ? Colors.blue : Colors.blue[200],
          size: 12,
        ),
        Icon(
          Icons.star,
          color: (dificultyLevel >= 2) ? Colors.blue : Colors.blue[200],
          size: 12,
        ),
        Icon(
          Icons.star,
          color: (dificultyLevel >= 3) ? Colors.blue : Colors.blue[200],
          size: 12,
        ),
        Icon(
          Icons.star,
          color: (dificultyLevel >= 4) ? Colors.blue : Colors.blue[200],
          size: 12,
        ),
        Icon(
          Icons.star,
          color: (dificultyLevel >= 5) ? Colors.blue : Colors.blue[200],
          size: 12,
        ),
      ],
    );
  }
}
