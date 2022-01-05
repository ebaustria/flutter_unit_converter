import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_converter/widgets/result_card.dart';

void main() {
  testWidgets('ResultCard content test', (WidgetTester tester) async {

    String result = '12.0';

    await tester.pumpWidget(
      MaterialApp(
        home: ResultCard(conversionResult: result,),
      ),
    );

    // Verify that the result card contains the correct content.
    expect(find.text('12.0'), findsOneWidget);
    expect(find.text('12.5'), findsNothing);
  });
}