import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/Screens/shoe_size_screen.dart';
import 'package:flutter_unit_converter/Screens/volume_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/length_screen.dart';
import '../screens/mass_screen.dart';
import '../screens/temperature_screen.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key, required this.title, required this.onIndexChanged}) : super(key: key);

  final String title;
  final Function(int) onIndexChanged;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _selectedIndex = 0;
  // add tabs in here
  var tabs = [
    TemperatureScreen(title: 'Temperature',),
    LengthScreen(title: 'Length & Distance'),
    MassScreen(title: 'Mass'),
    VolumeScreen(title: 'Volume'),
    ShoeSizeScreen(title: 'Shoe Size'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int value) {
    widget.onIndexChanged(value);
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    // chosen tab will be displayed here
    return Scaffold(
      body: Scaffold(body: tabs[_selectedIndex]),
      bottomNavigationBar: SizedBox(
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
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
    );
  }
}