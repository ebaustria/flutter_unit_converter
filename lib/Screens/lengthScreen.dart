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
    var length = Length()..convert(fromLength, amount);

    switch(toLength) {
      case LENGTH.inches: {
        newConversionResult = length.inches.value.toString();
      }
      break;
      case LENGTH.feet: {
        newConversionResult = length.feet.value.toString();
      }
      break;
      case LENGTH.yards: {
        newConversionResult = length.yards.value.toString();
      }
      break;
      case LENGTH.miles: {
        newConversionResult = length.miles.value.toString();
      }
      break;
      case LENGTH.micrometers: {
        newConversionResult = length.micrometers.value.toString();
      }
      break;
      case LENGTH.millimeters: {
        newConversionResult = length.millimeters.value.toString();
      }
      break;
      case LENGTH.centimeters: {
        newConversionResult = length.centimeters.value.toString();
      }
      break;
      case LENGTH.meters: {
        newConversionResult = length.meters.value.toString();
      }
      break;
      default: {
        newConversionResult = length.kilometers.value.toString();
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
    } else if (fromLength == toLength) {
      setState(() {
        conversionResult = amount.toString();
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
