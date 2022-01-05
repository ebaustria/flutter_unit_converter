import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/models/length_converter.dart';
import 'package:flutter_unit_converter/models/mass_converter.dart';
import 'package:flutter_unit_converter/models/shoe_size_converter.dart';
import 'package:flutter_unit_converter/models/temperature_converter.dart';
import 'package:flutter_unit_converter/models/units.dart';
import 'package:flutter_unit_converter/models/volume_converter.dart';
import 'package:flutter_unit_converter/screens/conversion_screen.dart';
import 'package:flutter_unit_converter/widgets/unit_tab_controller.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatefulWidget {
  UnitConverterApp({Key? key}) : super(key: key);

  static Units units = Units();

  final List<Widget> tabs = [
    ConversionScreen(converter: TemperatureConverter(), units: units.temperatureUnits.values.toList()),
    ConversionScreen(converter: LengthConverter(), units: units.lengthUnits.values.toList()),
    ConversionScreen(converter: MassConverter(), units: units.massUnits.values.toList()),
    ConversionScreen(converter: VolumeConverter(), units: units.volumeUnits.values.toList()),
    ConversionScreen(converter: ShoeSizeConverter(), units: units.shoeSizeUnits.values.toList()),
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
