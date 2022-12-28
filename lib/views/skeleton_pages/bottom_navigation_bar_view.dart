import 'package:flutter/material.dart';

import '../../theme/global_styles.dart';
import 'dart:math' as math;

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarView();
}

class _BottomNavigationBarView extends State<BottomNavigationBarView> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Text('Home page'),
    Text('Challanges page'),
    Text('Create page'),
    Text('Recipe page'),
    Text('Profile page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.tertiary,
        showSelectedLabels: true,
        selectedFontSize: navBarFontSize,
        unselectedFontSize: navBarFontSize,
        showUnselectedLabels: true,
        iconSize: navBarIconSize,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? const Icon(Icons.emoji_events) : const Icon(Icons.emoji_events_outlined),
            label: 'Challanges',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2 ? const Icon(Icons.add_circle) : const Icon(Icons.add_circle_outline),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3 ? const Icon(Icons.menu_book) : Transform(alignment: Alignment.center, transform: Matrix4.rotationY(math.pi), child: Icon(Icons.menu_book),),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4 ? const Icon(Icons.account_circle) : const Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}