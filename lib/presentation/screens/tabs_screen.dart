import 'package:flutter/material.dart';

import '/presentation/screens/history_screen.dart';
import '/presentation/screens/home_screen.dart';
import '/presentation/screens/settings_screen.dart';
import '/presentation/widgets/gradient_scaffold.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine which page to show based on selected tab
    Widget activePage = const HomeScreen();

   

    if (_selectedPageIndex == 1) {
      activePage = const HistoryScreen();
    } else if (_selectedPageIndex == 2) {
      activePage = const SettingsScreen();
    }

    return GradientScaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        fixedColor: Theme.of(context).colorScheme.primary,
        elevation: 5,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),

      body: activePage,
    );
  }
}
