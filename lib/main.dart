import 'package:flutter/material.dart';

import 'widgets/nav_bar.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatefulWidget {
  UnitConverterApp({Key? key}) : super(key: key);

  @override
  _UnitConverterAppState createState() => _UnitConverterAppState();
}

class _UnitConverterAppState extends State<UnitConverterApp> {
  int _selectedIndex = 0;
  var _colors = [
    Colors.deepOrange,
    Colors.purple,
    Colors.green,
    Colors.indigo,
    Colors.pink,
  ];

  void setTheme(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: _colors[_selectedIndex]),
      home: NavBar(title: 'Unit Converter', onIndexChanged: setTheme),
    );
  }
}
