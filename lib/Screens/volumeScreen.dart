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
  double amount = 0;

  void setFromVolume(Object? newVolume) {
    fromVolume = newVolume as VOLUME;
  }

  void setToVolume(Object? newVolume) {
    toVolume = newVolume as VOLUME;
  }

  void handleAmountChange(String? newAmount) {
    setState(() {
      amount = double.parse(newAmount!);
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
      body: ConversionForm(
        units: widget.volumes,
        getFromUnit: setFromVolume,
        getToUnit: setToVolume,
        onTextChanged: handleAmountChange,
      ),
    );
  }
}
