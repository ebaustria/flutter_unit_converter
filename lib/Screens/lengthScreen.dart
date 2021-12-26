import 'package:flutter/material.dart';
import 'package:units_converter/properties/length.dart';

import '../Widgets/conversionForm.dart';

class LengthScreen extends StatefulWidget {
  LengthScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<LENGTH> lengths = [
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
  late LENGTH fromLength;
  late LENGTH toLength;
  double amount = 0;

  void setFromLength(Object? newLength) {
    fromLength = newLength as LENGTH;
  }

  void setToLength(Object? newLength) {
    toLength = newLength as LENGTH;
  }

  void handleAmountChange(String? newAmount) {
    setState(() {
      amount = double.parse(newAmount!);
    });
  }

  @override
  void initState() {
    super.initState();
    fromLength = widget.lengths.first;
    toLength = widget.lengths[1];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ConversionForm(
        units: widget.lengths,
        getFromUnit: setFromLength,
        getToUnit: setToLength,
        onTextChanged: handleAmountChange,
      ),
    );
  }
}
