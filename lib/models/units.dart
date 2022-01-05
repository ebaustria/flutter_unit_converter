import 'package:units_converter/properties/length.dart';
import 'package:units_converter/properties/mass.dart';
import 'package:units_converter/properties/shoe_size.dart';
import 'package:units_converter/properties/temperature.dart';
import 'package:units_converter/properties/volume.dart';

class TemperatureUnits {
  final List<TEMPERATURE> units = [TEMPERATURE.fahrenheit, TEMPERATURE.celsius];
}

class MassUnits {
  final List<MASS> units = [
    MASS.ounces,
    MASS.pounds,
    MASS.tons,
    MASS.milligrams,
    MASS.centigrams,
    MASS.grams,
    MASS.kilograms,
  ];
}

class LengthUnits {
  final List<LENGTH> units = [
    LENGTH.inches,
    LENGTH.feet,
    LENGTH.yards,
    LENGTH.miles,
    LENGTH.micrometers,
    LENGTH.millimeters,
    LENGTH.centimeters,
    LENGTH.meters,
    LENGTH.kilometers,
  ];
}

class VolumeUnits {
  final List<VOLUME> units = [
    VOLUME.tablespoonsUs,
    VOLUME.cups,
    VOLUME.usPints,
    VOLUME.usGallons,
    VOLUME.milliliters,
    VOLUME.liters,
  ];
}

class ShoeSizeUnits {
  final List<SHOE_SIZE> units = [
    SHOE_SIZE.usaCanadaChild,
    SHOE_SIZE.ukIndiaChild,
    SHOE_SIZE.usaCanadaMan,
    SHOE_SIZE.ukIndiaMan,
    SHOE_SIZE.usaCanadaWoman,
    SHOE_SIZE.ukIndiaWoman,
    SHOE_SIZE.euChina,
  ];
}
