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
  double? amount;
  String conversionResult = "";

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

  void handleConversion() {
    if (amount == null) {
      setState(() {
        conversionResult = "";
      });
    } else if (fromMass == toMass) {
      setState(() {
        conversionResult = amount.toString();
      });
    } else {
      findGoalUnit();
    }
  }

  void findGoalUnit() {
    String newConversionResult;
    var mass = Mass()..convert(fromMass, amount);

    switch(toMass) {
      case MASS.ounces: {
        newConversionResult = mass.ounces.value.toString();
      }
      break;
      case MASS.pounds: {
        newConversionResult = mass.pounds.value.toString();
      }
      break;
      case MASS.tons: {
        newConversionResult = mass.tons.value.toString();
      }
      break;
      case MASS.milligrams: {
        newConversionResult = mass.milligrams.value.toString();
      }
      break;
      case MASS.centigrams: {
        newConversionResult = mass.centigrams.value.toString();
      }
      break;
      case MASS.grams: {
        newConversionResult = mass.grams.value.toString();
      }
      break;
      default: {
        newConversionResult = mass.kilograms.value.toString();
      }
      break;
    }
    setState(() {
      conversionResult = newConversionResult;
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
      body: Column(
        children: <Widget>[
          ConversionForm(
            units: widget.massUnits,
            getFromUnit: setFromMass,
            getToUnit: setToMass,
            onTextChanged: handleAmountChange,
          ),
          ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
          Text(conversionResult, style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }
}
