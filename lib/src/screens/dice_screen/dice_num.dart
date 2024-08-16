import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roll_app/src/models/dice.dart';
import 'package:dice_roll_app/src/providers/dice_list.dart';

class DiceNum extends ConsumerStatefulWidget {
  const DiceNum({super.key, required this.dice});

  final Dice dice;

  @override
  ConsumerState<DiceNum> createState() => _DiceNumState();
}

class _DiceNumState extends ConsumerState<DiceNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () => setState(() {
                    ref.read(diceListProvider.notifier).removeDice(widget.dice);
                  }),
              icon: const Icon(Icons.remove_outlined, size: 20)),
          Text(
            widget.dice.n.toString(),
            style: const TextStyle(fontSize: 22),
          ),
          IconButton(
              onPressed: () => setState(() {
                    ref
                        .read(diceListProvider.notifier)
                        .addDice(widget.dice, context);
                  }),
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
