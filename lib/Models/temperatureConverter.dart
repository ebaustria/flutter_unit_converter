import 'package:flutter_unit_converter/Models/unitConverter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/temperature.dart';

class TemperatureConverter extends UnitConverter {
  @override
  String convert(Object fromTemp, Object toTemp, double? amount) {
    String conversionResult;
    Temperature temp = Temperature(significantFigures: 8, removeTrailingZeros: true);
    temp.convert(fromTemp as TEMPERATURE, amount);

    if (amount == null) {
      conversionResult = "";
    } else if (toTemp == TEMPERATURE.celsius) {
      Unit c = temp.celsius;
      conversionResult = '${roundDouble(c.stringValue!)} ${c.symbol}';
    } else {
      Unit f = temp.fahrenheit;
      conversionResult = '${roundDouble(f.stringValue!)} ${f.symbol}';
    }
    
    return conversionResult;
  }

}