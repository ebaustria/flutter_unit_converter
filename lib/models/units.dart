import 'package:units_converter/properties/length.dart';
import 'package:units_converter/properties/mass.dart';
import 'package:units_converter/properties/shoe_size.dart';
import 'package:units_converter/properties/temperature.dart';
import 'package:units_converter/properties/volume.dart';

class Units {
  final Map<String, TEMPERATURE> temperatureUnits = {
    'fahrenheit': TEMPERATURE.fahrenheit,
    'celsius': TEMPERATURE.celsius
  };

  final Map<String, MASS> massUnits = {
    'ounces': MASS.ounces,
    'pounds': MASS.pounds,
    'milligrams': MASS.milligrams,
    'centigrams': MASS.centigrams,
    'grams': MASS.grams,
    'kilograms': MASS.kilograms,
    'metric tons': MASS.tons,
  };

  final Map<String, LENGTH> lengthUnits = {
    'inches': LENGTH.inches,
    'feet': LENGTH.feet,
    'yards': LENGTH.yards,
    'miles': LENGTH.miles,
    'micrometers': LENGTH.micrometers,
    'millimeters': LENGTH.millimeters,
    'centimeters': LENGTH.centimeters,
    'meters': LENGTH.meters,
    'kilometers': LENGTH.kilometers,
  };

  final Map<String, VOLUME> volumeUnits = {
    'tablespoons': VOLUME.tablespoonsUs,
    'cups': VOLUME.cups,
    'pints': VOLUME.usPints,
    'gallons': VOLUME.usGallons,
    'milliliters': VOLUME.milliliters,
    'liters': VOLUME.liters,
  };

  final Map<String, SHOE_SIZE> shoeSizeUnits = {
    "US children's": SHOE_SIZE.usaCanadaChild,
    "UK children's": SHOE_SIZE.ukIndiaChild,
    "US men's": SHOE_SIZE.usaCanadaMan,
    "UK men's": SHOE_SIZE.ukIndiaMan,
    "US women's": SHOE_SIZE.usaCanadaWoman,
    "UK women's": SHOE_SIZE.ukIndiaWoman,
    'EU': SHOE_SIZE.euChina,
  };
}
