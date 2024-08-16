import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roll_app/src/models/history_dice.dart';
import 'package:dice_roll_app/src/providers/dice_history.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<HistoryDice> historyList = ref.watch(diceHistoryProvider);
    int historyListLength = historyList.length;

    return historyListLength == 0
        ? const Center(child: Text("First roll a dice."))
        : ListView.builder(
            itemCount: historyListLength,
            itemBuilder: (context, index) {
              HistoryDice historyDice = historyList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: ListTile(
                  title: Text('Dice: ${historyDice.result}'),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var dice in historyDice.dices)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: dice.image!.image,
                                  fit: BoxFit.contain),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                dice.value.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}
