import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/models/volume_converter.dart';
import 'package:flutter_unit_converter/widgets/result_card.dart';
import 'package:units_converter/properties/volume.dart';

import '../widgets/conversion_form.dart';

class VolumeScreen extends StatefulWidget {
  VolumeScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final VolumeConverter volumeConverter = VolumeConverter();
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
    String newConversionResult;
    if (amount == null) {
      newConversionResult = "";
    } else {
      newConversionResult = widget.volumeConverter.convert(fromVolume, toVolume, amount);
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

    return Column(
      children: <Widget>[
        ConversionForm(
          units: widget.volumes,
          getFromUnit: setFromVolume,
          getToUnit: setToVolume,
          onTextChanged: handleAmountChange,
        ),
        ElevatedButton(onPressed: handleConversion, child: Text("Convert")),
        ResultCard(conversionResult: conversionResult),
      ],
    );
  }
}
