import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dice_roll_app/src/screens/dice_screen/dice_screen.dart';
import 'package:dice_roll_app/src/screens/history_screen/history_screen.dart';
import 'package:dice_roll_app/src/screens/tabletop_screen/tabletop_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> screens = <Widget>[
    const TabletopScreen(),
    const DiceScreen(),
    const HistoryScreen(),
  ];

  void _pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice Roll')),
      body: PageView(
        onPageChanged: _pageChanged,
        controller: _pageController,
        children: screens,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.25),
                offset: const Offset(0, 25),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              onTabChange: (index) {
                _pageChanged(index);
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              selectedIndex: _selectedIndex,
              rippleColor:
                  Theme.of(context).colorScheme.primary.withOpacity(.2),
              hoverColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
              gap: 8,
              activeColor: Theme.of(context).colorScheme.primary,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabActiveBorder: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(.6),
              tabs: const [
                GButton(
                    icon: Icons.table_restaurant_outlined, text: 'Tabletop'),
                GButton(icon: Icons.casino_outlined, text: 'Dice'),
                GButton(icon: Icons.history, text: 'History')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
