import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dice_roll_app/src/models/dice.dart';

part 'add_dice.g.dart';

@Riverpod(keepAlive: true)
class AddDice extends _$AddDice {
  @override
  List<Dice> build() {
    return [
      Dice(4),
      Dice(6),
      Dice(8),
      Dice(10),
      Dice(12),
      Dice(20),
    ];
  }

  void addDice(int sides, BuildContext context) {
    if (state.length < 20) {
      state = [...state, Dice(sides)];
    } else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You can't add more dice.")));
    }
  }
}
