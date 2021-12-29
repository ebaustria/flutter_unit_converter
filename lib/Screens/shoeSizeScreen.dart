import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/Models/shoeSizeConverter.dart';
import 'package:flutter_unit_converter/Widgets/resultCard.dart';
import 'package:units_converter/properties/shoe_size.dart';

import '../Widgets/conversionForm.dart';

class ShoeSizeScreen extends StatefulWidget {
  ShoeSizeScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final ShoeSizeConverter shoeSizeConverter = ShoeSizeConverter();
  final List<SHOE_SIZE> sizes = [
    SHOE_SIZE.usaCanadaChild,
    SHOE_SIZE.usaCanadaMan,
    SHOE_SIZE.usaCanadaWoman,
    SHOE_SIZE.ukIndiaChild,
    SHOE_SIZE.ukIndiaMan,
    SHOE_SIZE.ukIndiaWoman,
    SHOE_SIZE.euChina,
  ];

  @override
  _ShoeSizeScreenState createState() => _ShoeSizeScreenState();
}

class _ShoeSizeScreenState extends State<ShoeSizeScreen> {
  late SHOE_SIZE fromSize;
  late SHOE_SIZE toSize;
  double? amount;
  String conversionResult = "";

  void setFromSize(Object? newSize) {
    setState(() {
      fromSize = newSize as SHOE_SIZE;
    });
  }

  void setToSize(Object? newSize) {
    setState(() {
      toSize = newSize as SHOE_SIZE;
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
    String newConversionResult;
    if (amount == null) {
      newConversionResult = "";
    } else {
      newConversionResult = widget.shoeSizeConverter.convert(fromSize, toSize, amount);
    }
    setState(() {
      conversionResult = newConversionResult;
    });
  }

  @override
  void initState() {
    super.initState();
    fromSize = widget.sizes.first;
    toSize = widget.sizes[1];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ConversionForm(
              units: widget.sizes,
              getFromUnit: setFromSize,
              getToUnit: setToSize,
              onTextChanged: handleAmountChange,
            ),
            ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
            ResultCard(conversionResult: conversionResult),
          ]
      ),
    );
  }
}
