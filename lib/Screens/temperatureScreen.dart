import 'package:flutter/material.dart';
import 'package:units_converter/properties/temperature.dart';

import '../Widgets/conversionForm.dart';

class TemperatureScreen extends StatefulWidget {
  TemperatureScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<TEMPERATURE> temps = [TEMPERATURE.fahrenheit, TEMPERATURE.celsius];

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  late TEMPERATURE fromTemp;
  late TEMPERATURE toTemp;
  double? amount;

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

  String handleConversion() {
    if (amount == null) {
      return "";
    }

    if (fromTemp == toTemp) {
      return amount.toString();
    }

    var temp = Temperature()..convert(fromTemp, amount);

    if (fromTemp == TEMPERATURE.fahrenheit) {
      return temp.celsius.value.toString();
    }

    return temp.fahrenheit.value.toString();
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
          Text(handleConversion(), style: TextStyle(fontSize: 32)),
        ]
      ),
    );
  }
}
