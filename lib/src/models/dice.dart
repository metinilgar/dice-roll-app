import 'package:flutter/material.dart';

class Dice {
  final int sides;
  late int value;
  late int n;

  Image? image;

  Dice(this.sides) {
    n = 0;
    value = 0;

    if ([4, 6, 8, 10, 12, 20].contains(sides)) {
      image = Image.asset(
        'assets/images/dice_${sides.toString()}.png',
        fit: BoxFit.contain,
      );
    } else {
      image = Image.asset(
        'assets/images/default.png',
        fit: BoxFit.contain,
      );
    }
  }
}
