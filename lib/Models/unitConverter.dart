
abstract class UnitConverter {
  double roundDouble(String value) => double.parse((double.parse(value)).toStringAsFixed(6));

  String convert(Object fromUnit, Object toUnit, double? amount);
}
