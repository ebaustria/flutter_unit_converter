import 'package:flutter_unit_converter/Models/unitConverter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/volume.dart';

class VolumeConverter extends UnitConverter {
  @override
  String convert(fromVolume, toVolume, double? amount) {
    String conversionResult;
    Volume volume = Volume(significantFigures: 8, removeTrailingZeros: true);
    volume.convert(fromVolume as VOLUME, amount);

    switch(toVolume) {
      case VOLUME.tablespoonsUs: {
        Unit tbsp = volume.tablespoonsUs;
        conversionResult = '${roundDouble(tbsp.stringValue!)} ${tbsp.symbol}';
      }
      break;
      case VOLUME.cups: {
        Unit cups = volume.cups;
        conversionResult = '${roundDouble(cups.stringValue!)} ${cups.symbol}';
      }
      break;
      case VOLUME.usPints: {
        Unit pints = volume.usPints;
        conversionResult = '${roundDouble(pints.stringValue!)} ${pints.symbol}';
      }
      break;
      case VOLUME.usGallons: {
        Unit gallons = volume.usGallons;
        conversionResult = '${roundDouble(gallons.stringValue!)} ${gallons.symbol}';
      }
      break;
      case VOLUME.milliliters: {
        Unit ml = volume.milliliters;
        conversionResult = '${roundDouble(ml.stringValue!)} ${ml.symbol}';
      }
      break;
      default: {
        Unit liters = volume.liters;
        conversionResult = '${roundDouble(liters.stringValue!)} ${liters.symbol}';
      }
      break;
    }
    return conversionResult;
  }
}