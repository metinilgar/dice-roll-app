import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dice_roll_app/src/app.dart';
import 'package:dice_roll_app/src/constants.dart';

void main() {
  runApp(const ProviderScope(child: DiceRollApp()));
}

class DiceRollApp extends StatelessWidget {
  const DiceRollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(colorScheme: kColorScheme),
      darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkColorScheme),
      home: const TabScreen(),
    );
  }
}
