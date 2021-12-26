import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/Widgets/dropdownMenu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConversionForm extends StatefulWidget {
  ConversionForm({
    Key? key,
    required this.units,
    required this.getFromUnit,
    required this.getToUnit,
    required this.onTextChanged,
  }) : super(key: key);

  final List<Object> units;
  final Function(Object?) getFromUnit;
  final Function(Object?) getToUnit;
  final Function(String?) onTextChanged;

  @override
  _ConversionFormState createState() => _ConversionFormState();
}

class _ConversionFormState extends State<ConversionForm> {
  final GlobalKey<DropdownMenuState> _fromMenuState = GlobalKey<DropdownMenuState>();
  final GlobalKey<DropdownMenuState> _toMenuState = GlobalKey<DropdownMenuState>();
  late DropdownMenu from;
  late DropdownMenu to;

  void swapUnits() {
    Object? toUnit = _toMenuState.currentState?.selectedUnit;
    Object? fromUnit = _fromMenuState.currentState?.selectedUnit;
    _fromMenuState.currentState?.onUnitChanged(toUnit);
    _toMenuState.currentState?.onUnitChanged(fromUnit);
  }

  @override
  void initState() {
    super.initState();
    from = DropdownMenu(
      key: _fromMenuState,
      units: widget.units,
      getUnit: widget.getFromUnit,
      initialUnit: widget.units.first,
    );
    to = DropdownMenu(
      key: _toMenuState,
      units: widget.units,
      getUnit: widget.getToUnit,
      initialUnit: widget.units[1],
    );
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
                    onChanged: widget.onTextChanged,
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
