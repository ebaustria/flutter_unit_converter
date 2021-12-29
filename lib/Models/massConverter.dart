import 'package:flutter_unit_converter/Models/unitConverter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/mass.dart';

class MassConverter extends UnitConverter {
  @override
  String convert(Object fromMass, Object toMass, double? amount) {
    String conversionResult;
    Mass mass = Mass(significantFigures: 8, removeTrailingZeros: true);
    mass.convert(fromMass as MASS, amount);

    switch(toMass) {
      case MASS.ounces: {
        Unit oz = mass.ounces;
        conversionResult = '${roundDouble(oz.stringValue!)} ${oz.symbol}';
      }
      break;
      case MASS.pounds: {
        Unit lbs = mass.pounds;
        conversionResult = '${roundDouble(lbs.stringValue!)} ${lbs.symbol}';
      }
      break;
      case MASS.tons: {
        Unit tons = mass.tons;
        conversionResult = '${roundDouble(tons.stringValue!)} ${tons.symbol}';
      }
      break;
      case MASS.milligrams: {
        Unit mg = mass.milligrams;
        conversionResult = '${roundDouble(mg.stringValue!)} ${mg.symbol}';
      }
      break;
      case MASS.centigrams: {
        Unit cg = mass.centigrams;
        conversionResult = '${roundDouble(cg.stringValue!)} ${cg.symbol}';
      }
      break;
      case MASS.grams: {
        Unit grams = mass.grams;
        conversionResult = '${roundDouble(grams.stringValue!)} ${grams.symbol}';
      }
      break;
      default: {
        Unit kg = mass.kilograms;
        conversionResult = '${roundDouble(kg.stringValue!)} ${kg.symbol}';
      }
      break;
    }
    return conversionResult;
  }

}