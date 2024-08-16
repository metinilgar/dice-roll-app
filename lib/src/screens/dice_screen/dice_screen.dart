import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roll_app/src/models/dice.dart';
import 'package:dice_roll_app/src/providers/add_dice.dart';
import 'package:dice_roll_app/src/providers/dice_list.dart';
import 'package:dice_roll_app/src/screens/dice_screen/dice_item.dart';

class DiceScreen extends ConsumerStatefulWidget {
  const DiceScreen({super.key});

  @override
  ConsumerState<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends ConsumerState<DiceScreen> {
  Future<void> _showAddDiceDialog(BuildContext context) async {
    int? side;
    bool validate = false;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Choose number of sides"),
              content: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Sides",
                  errorText: validate ? "Please enter a valid value." : null,
                  hintText: "17",
                ),
                onChanged: (value) {
                  side = int.tryParse(value);
                },
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      if (side != null && side! < 1000 && side! > 1) {
                        ref
                            .read(addDiceProvider.notifier)
                            .addDice(side!, context);
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          validate = true;
                        });
                      }
                    },
                    child: const Text("Submit")),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Dice> diceList = ref.watch(addDiceProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
          children: diceList.map((e) => DiceItem(dice: e)).toList(),
        ),
        Positioned(
            bottom: 20,
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _showAddDiceDialog(context);
                    },
                    child: const Text("Add")),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ref.read(diceListProvider.notifier).resetDice();
                      });
                    },
                    child: const Text("Reset")),
              ],
            )),
      ],
    );
  }
}
