import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  // Added parameters to allow for interaction and state management from the parent widget
  final int selectedIndex;
  final Function(int) onTap;

  // Require the selected index and the onTap callback in the constructor
  const BottomNavBar({Key? key, required this.selectedIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Soy empresa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      currentIndex: selectedIndex, // Set the current index to change the selected item
      onTap: onTap, // Use the onTap callback to notify the parent widget of selection changes
      unselectedItemColor: Colors.grey, // Set unselected items to gray
      selectedItemColor: Theme.of(context).primaryColor, // Optional: Set selected item color to the theme's primary color
    );
  }
}
