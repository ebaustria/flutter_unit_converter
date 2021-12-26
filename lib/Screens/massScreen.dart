import 'package:flutter/material.dart';
import 'package:units_converter/properties/mass.dart';

import '../Widgets/conversionForm.dart';

class MassScreen extends StatefulWidget {
  MassScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<MASS> massUnits = [
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
  late MASS fromMass;
  late MASS toMass;
  double amount = 0;

  void setFromMass(Object? newMass) {
    fromMass = newMass as MASS;
  }

  void setToMass(Object? newMass) {
    toMass = newMass as MASS;
  }

  void handleAmountChange(String? newAmount) {
    double newDouble;
    try {
      newDouble = double.parse(newAmount!);
    } on FormatException {
      newDouble = 0;
    }
    setState(() {
      amount = newDouble;
    });
  }

  @override
  void initState() {
    super.initState();
    fromMass = widget.massUnits.first;
    toMass = widget.massUnits[1];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ConversionForm(
        units: widget.massUnits,
        getFromUnit: setFromMass,
        getToUnit: setToMass,
        onTextChanged: handleAmountChange,
      ),
    );
  }
}
