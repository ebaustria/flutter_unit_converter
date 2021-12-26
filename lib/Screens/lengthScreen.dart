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
    if (fromLength == toLength) {
      print(amount);
      return;
    }
    var length = Length()..convert(fromLength, amount);
    switch(toLength) {
      case LENGTH.inches: {
        print(length.inches.value);
      }
      break;
      case LENGTH.feet: {
        print(length.feet.value);
      }
      break;
      case LENGTH.yards: {
        print(length.yards.value);
      }
      break;
      case LENGTH.miles: {
        print(length.miles.value);
      }
      break;
      case LENGTH.micrometers: {
        print(length.micrometers.value);
      }
      break;
      case LENGTH.millimeters: {
        print(length.millimeters.value);
      }
      break;
      case LENGTH.centimeters: {
        print(length.centimeters.value);
      }
      break;
      case LENGTH.meters: {
        print(length.meters.value);
      }
      break;
      default: {
        print(length.kilometers.value);
      }
      break;
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
        ],
      ),
    );
  }
}
