import 'package:flutter/material.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/volume.dart';

import '../Widgets/conversionForm.dart';

class VolumeScreen extends StatefulWidget {
  VolumeScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<VOLUME> volumes = [
    VOLUME.tablespoonsUs,
    VOLUME.cups,
    VOLUME.usPints,
    VOLUME.usGallons,
    VOLUME.milliliters,
    VOLUME.liters,
  ];

  @override
  _VolumeScreenState createState() => _VolumeScreenState();
}

class _VolumeScreenState extends State<VolumeScreen> {
  late VOLUME fromVolume;
  late VOLUME toVolume;
  double? amount;
  String conversionResult = "";

  void setFromVolume(Object? newVolume) {
    fromVolume = newVolume as VOLUME;
  }

  void setToVolume(Object? newVolume) {
    toVolume = newVolume as VOLUME;
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
    Volume volume = Volume(significantFigures: 8, removeTrailingZeros: true);
    volume.convert(fromVolume, amount);

    switch(toVolume) {
      case VOLUME.tablespoonsUs: {
        Unit tbsp = volume.tablespoonsUs;
        newConversionResult = '${tbsp.stringValue} ${tbsp.symbol}';
      }
      break;
      case VOLUME.cups: {
        Unit cups = volume.cups;
        newConversionResult = '${cups.stringValue} ${cups.symbol}';
      }
      break;
      case VOLUME.usPints: {
        Unit pints = volume.usPints;
        newConversionResult = '${pints.stringValue} ${pints.symbol}';
      }
      break;
      case VOLUME.usGallons: {
        Unit gallons = volume.usGallons;
        newConversionResult = '${gallons.stringValue} ${gallons.symbol}';
      }
      break;
      case VOLUME.milliliters: {
        Unit ml = volume.milliliters;
        newConversionResult = '${ml.stringValue} ${ml.symbol}';
      }
      break;
      default: {
        Unit liters = volume.liters;
        newConversionResult = '${liters.stringValue} ${liters.symbol}';
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
    fromVolume = widget.volumes.first;
    toVolume = widget.volumes[1];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          ConversionForm(
            units: widget.volumes,
            getFromUnit: setFromVolume,
            getToUnit: setToVolume,
            onTextChanged: handleAmountChange,
          ),
          ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
          Text(conversionResult, style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }
}
