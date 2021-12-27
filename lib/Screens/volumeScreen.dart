import 'package:flutter/material.dart';
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
    } else if (fromVolume == toVolume) {
      setState(() {
        conversionResult = amount.toString();
      });
    } else {
      findGoalUnit();
    }
  }

  void findGoalUnit() {
    String newConversionResult;
    var mass = Volume()..convert(fromVolume, amount);

    switch(toVolume) {
      case VOLUME.tablespoonsUs: {
        newConversionResult = mass.tablespoonsUs.value.toString();
      }
      break;
      case VOLUME.cups: {
        newConversionResult = mass.cups.value.toString();
      }
      break;
      case VOLUME.usPints: {
        newConversionResult = mass.usPints.value.toString();
      }
      break;
      case VOLUME.usGallons: {
        newConversionResult = mass.usGallons.value.toString();
      }
      break;
      case VOLUME.milliliters: {
        newConversionResult = mass.milliliters.value.toString();
      }
      break;
      default: {
        newConversionResult = mass.liters.value.toString();
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
