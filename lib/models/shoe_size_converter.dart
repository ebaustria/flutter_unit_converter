import 'package:flutter_unit_converter/models/unit_converter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/shoe_size.dart';

class ShoeSizeConverter extends UnitConverter {
  @override
  String convert(Object fromSize, Object toSize, double? amount) {
    String conversionResult;
    ShoeSize size = ShoeSize(significantFigures: 8, removeTrailingZeros: true);
    size.convert(fromSize as SHOE_SIZE, amount);

    switch(toSize) {
      case SHOE_SIZE.usaCanadaChild: {
        Unit usChild = size.usaCanadaChild;
        conversionResult = '${roundDouble(usChild.stringValue!)}';
      }
      break;
      case SHOE_SIZE.usaCanadaMan: {
        Unit usMan = size.usaCanadaMan;
        conversionResult = '${roundDouble(usMan.stringValue!)}';
      }
      break;
      case SHOE_SIZE.usaCanadaWoman: {
        Unit usWoman = size.usaCanadaWoman;
        conversionResult = '${roundDouble(usWoman.stringValue!)}';
      }
      break;
      case SHOE_SIZE.ukIndiaChild: {
        Unit ukChild = size.ukIndiaChild;
        conversionResult = '${roundDouble(ukChild.stringValue!)}';
      }
      break;
      case SHOE_SIZE.ukIndiaMan: {
        Unit ukMan = size.ukIndiaMan;
        conversionResult = '${roundDouble(ukMan.stringValue!)}';
      }
      break;
      case SHOE_SIZE.ukIndiaWoman: {
        Unit ukWoman = size.ukIndiaWoman;
        conversionResult = '${roundDouble(ukWoman.stringValue!)}';
      }
      break;
      default: {
        Unit eu = size.euChina;
        conversionResult = '${roundDouble(eu.stringValue!)}';
      }
      break;
    }
    return conversionResult;
  }
  
}