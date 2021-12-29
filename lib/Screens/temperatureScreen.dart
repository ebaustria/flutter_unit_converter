import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/Models/temperatureConverter.dart';
import 'package:flutter_unit_converter/Widgets/resultCard.dart';
import 'package:units_converter/properties/temperature.dart';

import '../Widgets/conversionForm.dart';

class TemperatureScreen extends StatefulWidget {
  TemperatureScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final TemperatureConverter temperatureConverter = TemperatureConverter();
  final List<TEMPERATURE> temps = [TEMPERATURE.fahrenheit, TEMPERATURE.celsius];

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  late TEMPERATURE fromTemp;
  late TEMPERATURE toTemp;
  double? amount;
  String conversionResult = "";

  void setFromTemp(Object? newTemp) {
    setState(() {
      fromTemp = newTemp as TEMPERATURE;
    });
  }

  void setToTemp(Object? newTemp) {
    setState(() {
      toTemp = newTemp as TEMPERATURE;
    });
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

  void handleConversion() {
    setState(() {
      conversionResult = widget.temperatureConverter.convert(fromTemp, toTemp, amount);
    });
  }

  @override
  void initState() {
    super.initState();
    fromTemp = widget.temps.first;
    toTemp = widget.temps[1];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ConversionForm(
            units: widget.temps,
            getFromUnit: setFromTemp,
            getToUnit: setToTemp,
            onTextChanged: handleAmountChange,
          ),
          ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
          ResultCard(conversionResult: conversionResult),
        ]
      ),
    );
  }
}
