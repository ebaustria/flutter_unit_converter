import 'package:flutter_unit_converter/models/unit_converter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/length.dart';

class LengthConverter extends UnitConverter {
  @override
  String convert(Object fromLength, Object toLength, double? amount) {
    String conversionResult;
    Length length = Length(significantFigures: 8, removeTrailingZeros: true);
    length.convert(fromLength as LENGTH, amount);

    switch(toLength) {
      case LENGTH.inches: {
        Unit inches = length.inches;
        conversionResult = '${roundDouble(inches.stringValue!)} ${inches.symbol}';
      }
      break;
      case LENGTH.feet: {
        Unit ft = length.feet;
        conversionResult = '${roundDouble(ft.stringValue!)} ${ft.symbol}';
      }
      break;
      case LENGTH.yards: {
        Unit yd = length.yards;
        conversionResult = '${roundDouble(yd.stringValue!)} ${yd.symbol}';
      }
      break;
      case LENGTH.miles: {
        Unit miles = length.miles;
        conversionResult = '${roundDouble(miles.stringValue!)} ${miles.symbol}';
      }
      break;
      case LENGTH.micrometers: {
        Unit micrometers = length.micrometers;
        conversionResult = '${roundDouble(micrometers.stringValue!)} ${micrometers.symbol}';
      }
      break;
      case LENGTH.millimeters: {
        Unit mm = length.millimeters;
        conversionResult = '${roundDouble(mm.stringValue!)} ${mm.symbol}';
      }
      break;
      case LENGTH.centimeters: {
        Unit cm = length.centimeters;
        conversionResult = '${roundDouble(cm.stringValue!)} ${cm.symbol}';
      }
      break;
      case LENGTH.meters: {
        Unit m = length.meters;
        conversionResult = '${roundDouble(m.stringValue!)} ${m.symbol}';
      }
      break;
      default: {
        Unit km = length.kilometers;
        conversionResult = '${roundDouble(km.stringValue!)} ${km.symbol}';
      }
      break;
    }
    return conversionResult;
  }
  
}