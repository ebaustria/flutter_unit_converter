import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/Widgets/dropdownMenu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConversionUI extends StatefulWidget {
  ConversionUI({Key? key, required this.units}) : super(key: key);

  final List<Object> units;

  @override
  _ConversionUIState createState() => _ConversionUIState();
}

class _ConversionUIState extends State<ConversionUI> {
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
    from = DropdownMenu(key: _fromMenuState, units: widget.units);
    to = DropdownMenu(key: _toMenuState, units: widget.units);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
    );
  }
}
