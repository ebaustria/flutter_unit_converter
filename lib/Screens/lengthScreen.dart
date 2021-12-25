import 'package:flutter/material.dart';
import 'package:units_converter/properties/length.dart';

import '../Widgets/conversionUI.dart';

class LengthScreen extends StatefulWidget {
  LengthScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<LENGTH> temps = [
    LENGTH.inches,
    LENGTH.feet,
    LENGTH.yards,
    LENGTH.miles,
    LENGTH.micrometers,
    LENGTH.millimeters,
    LENGTH.centimeters,
    LENGTH.meters,
    LENGTH.kilometers,
  ];

  @override
  _LengthScreenState createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ConversionUI(units: widget.temps),
    );
  }
}
