import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Screens/lengthScreen.dart';
import '../Screens/massScreen.dart';
import '../Screens/temperatureScreen.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key, required this.title}) : super(key: key);

  final String title;

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
    // VolumeScreen(title: 'Volume'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _handleLocationPermission();

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
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.ruler),
                label: 'Length',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.scale),
                label: 'Mass',
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
