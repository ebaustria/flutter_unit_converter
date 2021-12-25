import 'package:flutter/material.dart';

class DropdownMenu extends StatefulWidget {
  DropdownMenu({required Key key, required this.units}) : super(key: key);

  final List<Object> units;

  @override
  DropdownMenuState createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu> {
  Object? selectedUnit;

  void swapUnits(Object? newUnit) {
    setState(() {
      selectedUnit = newUnit;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.units.first;
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButton(
      value: selectedUnit,
      onChanged: (Object? value) {
        setState(() {
          selectedUnit = value;
        });
      },
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
