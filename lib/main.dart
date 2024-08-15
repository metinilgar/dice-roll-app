import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollApp());
}

class DiceRollApp extends StatelessWidget {
  const DiceRollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Dice Roll App with Flutter.'),
        ),
      ),
    );
  }
}
