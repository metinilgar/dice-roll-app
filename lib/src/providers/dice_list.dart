import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

import 'package:dice_roll_app/src/models/history_dice.dart';
import 'package:dice_roll_app/src/providers/add_dice.dart';
import 'package:dice_roll_app/src/providers/dice_history.dart';
import 'package:dice_roll_app/src/models/dice.dart';

part 'dice_list.g.dart';

@Riverpod(keepAlive: true)
class DiceList extends _$DiceList {
  @override
  List<Dice> build() {
    return [];
  }

  void rollAll(BuildContext context) {
    int totalResult = 0;
    for (var dice in state) {
      dice.value = Random().nextInt(dice.sides) + 1;
      totalResult += dice.value;
    }

    List<Dice> diceForHistory = [
      ...state.map((dice) {
        return Dice(dice.sides)
          ..value = dice.value
          ..n = dice.n;
      })
    ];

    ref.read(diceHistoryProvider.notifier).add(
          HistoryDice(
            dices: diceForHistory,
            result: totalResult,
            date: DateTime.now(),
          ),
        );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Rolled all dices. Total: $totalResult'),
      ),
    );
  }

  void addDice(Dice dice, BuildContext context) {
    if (state.length < 30) {
      state = [...state, Dice(dice.sides)];
      dice.n++;
    } else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You can't add more dice.")));
    }
  }

  void removeDice(Dice dice) {
    if (dice.n == 0) return;
    List<Dice> l = state;

    l.removeAt(l.indexWhere((element) => element.sides == dice.sides));
    state = l;

    dice.n--;
  }

  void resetDice() {
    List<Dice> diceList = ref.read(addDiceProvider);
    for (var dice in diceList) {
      dice.n = 0;
    }
    state = [];
  }
}
