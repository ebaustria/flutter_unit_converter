import 'package:flutter/material.dart';
import 'package:units_converter/models/unit.dart';
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
    } else {
      findGoalUnit();
    }
  }

  void findGoalUnit() {
    String newConversionResult;
    Mass mass = Mass(significantFigures: 8, removeTrailingZeros: true);
    mass.convert(fromMass, amount);

    switch(toMass) {
      case MASS.ounces: {
        Unit oz = mass.ounces;
        newConversionResult = '${oz.stringValue} ${oz.symbol}';
      }
      break;
      case MASS.pounds: {
        Unit lbs = mass.pounds;
        newConversionResult = '${lbs.stringValue} ${lbs.symbol}';
      }
      break;
      case MASS.tons: {
        Unit tons = mass.tons;
        newConversionResult = '${tons.stringValue} ${tons.symbol}';
      }
      break;
      case MASS.milligrams: {
        Unit mg = mass.milligrams;
        newConversionResult = '${mg.stringValue} ${mg.symbol}';
      }
      break;
      case MASS.centigrams: {
        Unit cg = mass.centigrams;
        newConversionResult = '${cg.stringValue} ${cg.symbol}';
      }
      break;
      case MASS.grams: {
        Unit grams = mass.grams;
        newConversionResult = '${grams.stringValue} ${grams.symbol}';
      }
      break;
      default: {
        Unit kg = mass.kilograms;
        newConversionResult = '${kg.stringValue} ${kg.symbol}';
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
