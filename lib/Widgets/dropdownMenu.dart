import 'package:flutter/material.dart';

class DropdownMenu extends StatefulWidget {
  DropdownMenu({
    required Key key,
    required this.units,
    required this.getUnit,
    required this.initialUnit,
  }) : super(key: key);

  final List<Object> units;
  final Function(Object?) getUnit;
  final Object initialUnit;

  @override
  DropdownMenuState createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu> {
  Object? selectedUnit;

  void onUnitChanged(Object? newUnit) {
    widget.getUnit(newUnit);
    setState(() {
      selectedUnit = newUnit;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.initialUnit;
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButton(
      value: selectedUnit,
      onChanged: onUnitChanged,
      items: widget.units
          .map<DropdownMenuItem<Object>>((Object value) {
        return DropdownMenuItem<Object>(
          value: value,
          child: Text(value.toString().split(".").last),
        );
      }).toList(),
    );
  }
}
