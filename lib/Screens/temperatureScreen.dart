import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/Widgets/dropdownMenu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:units_converter/properties/temperature.dart';

class TemperatureScreen extends StatefulWidget {
  TemperatureScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<TEMPERATURE> temps = [TEMPERATURE.fahrenheit, TEMPERATURE.celsius];

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final List<TEMPERATURE> temps = [TEMPERATURE.fahrenheit, TEMPERATURE.celsius];
  final GlobalKey<DropdownMenuState> _fromMenuState = GlobalKey<DropdownMenuState>();
  final GlobalKey<DropdownMenuState> _toMenuState = GlobalKey<DropdownMenuState>();
  late DropdownMenu from;
  late DropdownMenu to;

  void swapUnits() {
    Object? toUnit = _toMenuState.currentState?.selectedUnit;
    Object? fromUnit = _fromMenuState.currentState?.selectedUnit;
    _fromMenuState.currentState?.swapUnits(toUnit);
    _toMenuState.currentState?.swapUnits(fromUnit);
  }

  @override
  void initState() {
    super.initState();
    from = DropdownMenu(key: _fromMenuState, units: temps);
    to = DropdownMenu(key: _toMenuState, units: temps);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: const Text('From: ')),
                  Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                      ),
                  ),
                  from,
                ],
              ),
              ElevatedButton(
                  onPressed: swapUnits,
                  child: const Icon(MdiIcons.swapHorizontal)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(child: const Text('To: ')),
                  to,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
