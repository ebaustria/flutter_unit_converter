import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DropdownMenu extends StatefulWidget {
  DropdownMenu({
    required Key key,
    required this.units,
    required this.getUnit,
    required this.initialUnit,
  }) : super(key: key);

  final Map<String, Object> units;
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

    return Container(
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary)),
      ),
      child: DropdownButton(
        underline: SizedBox.shrink(),
        value: selectedUnit,
        onChanged: onUnitChanged,
        icon: Icon(MdiIcons.chevronDown),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        items: widget.units.entries
            .map<DropdownMenuItem<Object>>((MapEntry<String, Object> entry) {
          return DropdownMenuItem<Object>(
            value: entry.value,
            child: Text(entry.key),
          );
        }).toList(),
      )
    );
  }
}
