import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_converter/models/length_converter.dart';
import 'package:flutter_unit_converter/models/mass_converter.dart';
import 'package:flutter_unit_converter/models/shoe_size_converter.dart';
import 'package:flutter_unit_converter/models/temperature_converter.dart';
import 'package:flutter_unit_converter/models/units.dart';
import 'package:flutter_unit_converter/models/volume_converter.dart';
import 'package:flutter_unit_converter/screens/conversion_screen.dart';
import 'package:flutter_unit_converter/widgets/unit_tab_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {

  Units units = Units();
  final List<Widget> tabs = [
    ConversionScreen(
        converter: TemperatureConverter(),
        units: units.temperatureUnits
    ),
    ConversionScreen(converter: LengthConverter(), units: units.lengthUnits),
    ConversionScreen(converter: MassConverter(), units: units.massUnits),
    ConversionScreen(converter: VolumeConverter(), units: units.volumeUnits),
    ConversionScreen(converter: ShoeSizeConverter(), units: units.shoeSizeUnits),
  ];

  testWidgets('UnitTabController content test', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: UnitTabController(onTabChanged: (int index) {}, tabs: tabs,),
      ),
    );

    // Verify that the navigation bar contains the correct content.
    expect(find.byIcon(MdiIcons.thermometer), findsOneWidget);
    expect(find.byIcon(MdiIcons.scale), findsOneWidget);
    expect(find.byIcon(MdiIcons.cupWater), findsOneWidget);
    expect(find.byIcon(MdiIcons.ruler), findsOneWidget);
    expect(find.byIcon(MdiIcons.shoePrint), findsOneWidget);
  });

  testWidgets('UnitTabController update index test', (WidgetTester tester) async {

    int mutatedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: UnitTabController(tabs: tabs, onTabChanged: (int index) => {
          mutatedIndex = index
        }),
      ),
    );

    // Verify that the navigation bar updates the index correctly.
    await tester.tap(find.byIcon(MdiIcons.thermometer));
    await tester.pumpAndSettle();
    expect(mutatedIndex, 0);
    await tester.tap(find.byIcon(MdiIcons.scale));
    await tester.pumpAndSettle();
    expect(mutatedIndex, 2);
    await tester.tap(find.byIcon(MdiIcons.cupWater));
    await tester.pumpAndSettle();
    expect(mutatedIndex, 3);
    await tester.tap(find.byIcon(MdiIcons.ruler));
    await tester.pumpAndSettle();
    expect(mutatedIndex, 1);
    await tester.tap(find.byIcon(MdiIcons.shoePrint));
    await tester.pumpAndSettle();
    expect(mutatedIndex, 4);
  });
}