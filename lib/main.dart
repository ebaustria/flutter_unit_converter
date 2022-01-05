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

  static TemperatureUnits temperatureUnits = TemperatureUnits();
  static LengthUnits lengthUnits = LengthUnits();
  static MassUnits massUnits = MassUnits();
  static VolumeUnits volumeUnits = VolumeUnits();
  static ShoeSizeUnits shoeSizeUnits = ShoeSizeUnits();

  final List<Widget> tabs = [
    ConversionScreen(converter: TemperatureConverter(), units: temperatureUnits.units),
    ConversionScreen(converter: LengthConverter(), units: lengthUnits.units),
    ConversionScreen(converter: MassConverter(), units: massUnits.units),
    ConversionScreen(converter: VolumeConverter(), units: volumeUnits.units),
    ConversionScreen(converter: ShoeSizeConverter(), units: shoeSizeUnits.units),
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
