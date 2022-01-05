import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/widgets/dropdown_menu.dart';
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

  Widget buildRow(String text, DropdownMenu dropdown, bool isFrom) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: Text(text, style: TextStyle(fontSize: 18),)),
        if (isFrom) ...[
          Flexible(
            child: TextField(
              focusNode: FocusNode(),
              keyboardType: TextInputType.number,
              onChanged: widget.onTextChanged,
            ),
          ),
        ],
        Flexible(
          flex: 2,
          child: dropdown,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Spacer(),
            Flexible(
              flex: 1,
              child: buildRow('From:  ', from, true),
            ),
            Spacer(),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                  onPressed: swapUnits,
                  child: const Icon(MdiIcons.swapVertical)
              ),
            ),
            Spacer(),
            Flexible(
              flex: 1,
              child: buildRow('To:', to, false),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
