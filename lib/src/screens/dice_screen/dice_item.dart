import 'package:flutter/material.dart';
import 'package:dice_roll_app/src/models/dice.dart';
import 'package:dice_roll_app/src/screens/dice_screen/dice_num.dart';

class DiceItem extends StatelessWidget {
  const DiceItem({super.key, required this.dice});

  final Dice dice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: dice.image!.image, fit: BoxFit.contain),
            ),
            child: Center(
              child: Text(
                dice.sides.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: DiceNum(dice: dice),
        )
      ],
    );
  }
}
