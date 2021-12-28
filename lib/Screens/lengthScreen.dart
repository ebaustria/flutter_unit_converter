import 'package:flutter/material.dart';
import 'package:units_converter/models/unit.dart';
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
  double? amount;
  String conversionResult = "";

  void setFromLength(Object? newLength) {
    fromLength = newLength as LENGTH;
  }

  void setToLength(Object? newLength) {
    toLength = newLength as LENGTH;
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

  void findGoalUnit() {
    String newConversionResult;
    Length length = Length(significantFigures: 8, removeTrailingZeros: true);
    length.convert(fromLength, amount);

    switch(toLength) {
      case LENGTH.inches: {
        Unit inches = length.inches;
        newConversionResult = '${inches.stringValue} ${inches.symbol}';
      }
      break;
      case LENGTH.feet: {
        Unit ft = length.feet;
        newConversionResult = '${ft.stringValue} ${ft.symbol}';
      }
      break;
      case LENGTH.yards: {
        Unit yd = length.yards;
        newConversionResult = '${yd.stringValue} ${yd.symbol}';
      }
      break;
      case LENGTH.miles: {
        Unit miles = length.miles;
        newConversionResult = '${miles.stringValue} ${miles.symbol}';
      }
      break;
      case LENGTH.micrometers: {
        Unit micrometers = length.micrometers;
        newConversionResult = '${micrometers.stringValue} ${micrometers.symbol}';
      }
      break;
      case LENGTH.millimeters: {
        Unit mm = length.millimeters;
        newConversionResult = '${mm.stringValue} ${mm.symbol}';
      }
      break;
      case LENGTH.centimeters: {
        Unit cm = length.centimeters;
        newConversionResult = '${cm.stringValue} ${cm.symbol}';
      }
      break;
      case LENGTH.meters: {
        Unit m = length.meters;
        newConversionResult = '${m.stringValue} ${m.symbol}';
      }
      break;
      default: {
        Unit km = length.kilometers;
        newConversionResult = '${km.stringValue} ${km.symbol}';
      }
      break;
    }
    setState(() {
      conversionResult = newConversionResult;
    });
  }

  void handleConversion() {
    if (amount == null) {
      setState(() {
        conversionResult = "";
      });
    } else {
      findGoalUnit();
    }
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
      body: Column(
        children: <Widget>[
          ConversionForm(
            units: widget.lengths,
            getFromUnit: setFromLength,
            getToUnit: setToLength,
            onTextChanged: handleAmountChange,
          ),
          ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
          Text(conversionResult, style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }
}
