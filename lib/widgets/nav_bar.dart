import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
    required this.currentIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onIndexChanged;

  @override
  Widget build(BuildContext context) {
    // chosen tab will be displayed here
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.thermometer),
            label: 'Temperature',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.ruler),
            label: 'Length',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.scale),
            label: 'Mass',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.cupWater),
            label: 'Volume',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.shoePrint),
            label: 'Shoes',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        onTap: onIndexChanged,
      ),
    );
  }
}
