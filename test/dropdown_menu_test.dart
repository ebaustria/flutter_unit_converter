import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_converter/models/units.dart';
import 'package:flutter_unit_converter/widgets/dropdown_menu.dart';
import 'package:units_converter/properties/length.dart';

void main() {

  final Map<String, LENGTH> units = Units().lengthUnits;

  GlobalKey<DropdownMenuState> menuState = GlobalKey<DropdownMenuState>();

  testWidgets('Dropdown content test', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DropdownMenu(
            key: menuState,
            getUnit: (Object? obj) => {},
            units: units,
            initialUnit: units.values.first,
          ),
        ),
      ),
    );

    // Verify that the dropdown menu contains the correct content.
    expect(find.text('inches'), findsOneWidget);
    expect(find.text('feet'), findsOneWidget);
    expect(find.text('yards'), findsOneWidget);
    expect(find.text('miles'), findsOneWidget);
    expect(find.text('micrometers'), findsOneWidget);
    expect(find.text('millimeters'), findsOneWidget);
    expect(find.text('centimeters'), findsOneWidget);
    expect(find.text('meters'), findsOneWidget);
    expect(find.text('kilometers'), findsOneWidget);
  });

  /* testWidgets('Dropdown content test', (WidgetTester tester) async {

    var selectedUnit = units[0];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DropdownMenu(
            key: menuState,
            getUnit: (Object? obj) => {
              selectedUnit = obj as LENGTH
            },
            units: units,
            initialUnit: selectedUnit,
          ),
        ),
      ),
    );

    // Verify that the dropdown menu contains the correct content.
    expect(menuState.currentState?.selectedUnit, units[0]);
    await tester.tap(find.byIcon(MdiIcons.chevronDown));
    await tester.pump();
    await tester.tap(find.);
    expect(menuState.currentState?.selectedUnit, units[7]);
  }); */
}