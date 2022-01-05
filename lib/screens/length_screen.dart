import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/models/length_converter.dart';
import 'package:flutter_unit_converter/widgets/result_card.dart';
import 'package:units_converter/properties/length.dart';

import '../Widgets/conversion_form.dart';

class LengthScreen extends StatefulWidget {
  LengthScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final LengthConverter lengthConverter = LengthConverter();
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

  void handleConversion() {
    String newConversionResult;
    if (amount == null) {
      newConversionResult = "";
    } else {
      newConversionResult = widget.lengthConverter.convert(fromLength, toLength, amount);
    }
    setState(() {
      conversionResult = newConversionResult;
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

    return Column(
      children: <Widget>[
        ConversionForm(
          units: widget.lengths,
          getFromUnit: setFromLength,
          getToUnit: setToLength,
          onTextChanged: handleAmountChange,
        ),
        ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
        ResultCard(conversionResult: conversionResult),
      ],
    );
  }
}
