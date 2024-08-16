import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roll_app/src/models/dice.dart';
import 'package:dice_roll_app/src/providers/dice_list.dart';

class TabletopScreen extends ConsumerStatefulWidget {
  const TabletopScreen({super.key});

  @override
  ConsumerState<TabletopScreen> createState() => _TabletopScreenState();
}

class _TabletopScreenState extends ConsumerState<TabletopScreen> {
  @override
  Widget build(BuildContext context) {
    List<Dice> diceList = ref.watch(diceListProvider);
    bool diceListIsEmpty = diceList.isEmpty;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: diceListIsEmpty
              ? const Text("First add dice to the table.")
              : GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    for (var dice in diceList)
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: dice.image!.image, fit: BoxFit.contain),
                        ),
                        child: Center(
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
        Positioned(
            bottom: 40,
            child: ElevatedButton(
              onPressed: diceListIsEmpty
                  ? null
                  : () {
                      ref.read(diceListProvider.notifier).rollAll(context);
                      setState(() {});
                    },
              child: const Row(
                children: [
                  Icon(Icons.casino),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Roll All'),
                ],
              ),
            ))
      ],
    );
  }
}
