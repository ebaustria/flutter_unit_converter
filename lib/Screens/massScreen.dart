import 'package:flutter/material.dart';
import 'package:units_converter/properties/mass.dart';
import 'package:units_converter/properties/temperature.dart';

import '../Widgets/conversionUI.dart';

class MassScreen extends StatefulWidget {
  MassScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<MASS> temps = [
    MASS.ounces,
    MASS.pounds,
    MASS.tons,
    MASS.milligrams,
    MASS.centigrams,
    MASS.grams,
    MASS.kilograms,
  ];

  @override
  _MassScreenState createState() => _MassScreenState();
}

class _MassScreenState extends State<MassScreen> {

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
