import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/screens/length_screen.dart';
import 'package:flutter_unit_converter/screens/mass_screen.dart';
import 'package:flutter_unit_converter/screens/shoe_size_screen.dart';
import 'package:flutter_unit_converter/screens/temperature_screen.dart';
import 'package:flutter_unit_converter/screens/volume_screen.dart';
import 'package:flutter_unit_converter/widgets/unit_tab_controller.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatefulWidget {
  UnitConverterApp({Key? key}) : super(key: key);

  final List<Widget> tabs = [
    TemperatureScreen(title: 'Temperature',),
    LengthScreen(title: 'Length & Distance'),
    MassScreen(title: 'Mass'),
    VolumeScreen(title: 'Volume'),
    ShoeSizeScreen(title: 'Shoe Size'),
  ];

  @override
  _UnitConverterAppState createState() => _UnitConverterAppState();
}

class _UnitConverterAppState extends State<UnitConverterApp> {
  int selectedIndex = 0;
  var colors = [
    Colors.deepOrange,
    Colors.purple,
    Colors.green,
    Colors.indigo,
    Colors.pink,
  ];

  void onTabChanged(int newIndex) {
    FocusScopeNode focus = FocusScope.of(context);

    if (!focus.hasPrimaryFocus) {
      focus.focusedChild?.unfocus();
    }

    setState(() {
      selectedIndex = newIndex;
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
      theme: ThemeData(primarySwatch: colors[selectedIndex]),
      home: UnitTabController(
        tabs: widget.tabs,
        onTabChanged: onTabChanged,
      ),
    );
  }
}
