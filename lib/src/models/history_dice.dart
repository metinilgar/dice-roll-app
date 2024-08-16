import 'package:dice_roll_app/src/models/dice.dart';

class HistoryDice {
  final List<Dice> dices;
  final int result;
  final DateTime date;

  HistoryDice({
    required this.dices,
    required this.result,
    required this.date,
  });
}
