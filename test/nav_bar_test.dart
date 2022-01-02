import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_converter/widgets/nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  testWidgets('NavBar content test', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: NavBar(currentIndex: 0, onIndexChanged: (int index) => {}),
      ),
    );

    // Verify that the navigation bar contains the correct content.
    expect(find.byIcon(MdiIcons.thermometer), findsOneWidget);
    expect(find.byIcon(MdiIcons.scale), findsOneWidget);
    expect(find.byIcon(MdiIcons.cupWater), findsOneWidget);
    expect(find.byIcon(MdiIcons.ruler), findsOneWidget);
    expect(find.byIcon(MdiIcons.shoePrint), findsOneWidget);
  });

  testWidgets('NavBar update index test', (WidgetTester tester) async {

    int mutatedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: NavBar(currentIndex: mutatedIndex, onIndexChanged: (int index) => {
          mutatedIndex = index
        }),
      ),
    );

    // Verify that the navigation bar updates the index correctly.
    await tester.tap(find.byIcon(MdiIcons.thermometer));
    expect(mutatedIndex, 0);
    await tester.tap(find.byIcon(MdiIcons.scale));
    expect(mutatedIndex, 2);
    await tester.tap(find.byIcon(MdiIcons.cupWater));
    expect(mutatedIndex, 3);
    await tester.tap(find.byIcon(MdiIcons.ruler));
    expect(mutatedIndex, 1);
    await tester.tap(find.byIcon(MdiIcons.shoePrint));
    expect(mutatedIndex, 4);
  });
}