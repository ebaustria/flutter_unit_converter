import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/models/unit_converter.dart';
import 'package:flutter_unit_converter/widgets/input_section.dart';
import 'package:flutter_unit_converter/widgets/result_card.dart';

class ConversionScreen extends StatefulWidget {
  ConversionScreen({Key? key, required this.converter, required this.units}) : super(key: key);

  final UnitConverter converter;
  final List<Object> units;

  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  late Object fromUnit;
  late Object toUnit;
  double? amount;
  String conversionResult = "";

  void setFromUnit(Object? newUnit) {
    fromUnit = newUnit!;
  }

  void setToUnit(Object? newUnit) {
    toUnit = newUnit!;
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
    String newConversionResult;
    if (amount == null) {
      newConversionResult = "";
    } else {
      newConversionResult = widget.converter.convert(fromUnit, toUnit, amount);
    }
    setState(() {
      conversionResult = newConversionResult;
    });
  }

  @override
  void initState() {
    super.initState();
    fromUnit = widget.units.first;
    toUnit = widget.units[1];
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        InputSection(
          units: widget.units,
          getFromUnit: setFromUnit,
          getToUnit: setToUnit,
          onTextChanged: handleAmountChange,
        ),
        ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
        ResultCard(conversionResult: conversionResult),
      ],
    );
  }
}
