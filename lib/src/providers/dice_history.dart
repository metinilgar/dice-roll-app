import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dice_roll_app/src/models/history_dice.dart';

part 'dice_history.g.dart';

@Riverpod(keepAlive: true)
class DiceHistory extends _$DiceHistory {
  @override
  List<HistoryDice> build() {
    return [];
  }

  void add(HistoryDice history) {
    if (state.length <= 10) {
      state = [history, ...state];
    } else {
      List temp = state;
      temp.removeLast();
      state = [history, ...temp];
    }
  }
}
