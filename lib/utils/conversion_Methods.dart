class ConversionMethods{

  static double convertArea(double value, String fromUnit, String toUnit) {
    final unitMap = {
      'Square kilometer': 1e6,
      'Square meter': 1,
      'Square mile': 2.58999e6,
      'Square yard': 0.836127,
      'Square foot': 0.092903,
      'Square Inch': 6.4516e-4,
      'Hectare': 1e4,
      'Acre': 4046.86,
    };

    final fromUnitValue = unitMap[fromUnit];
    final toUnitValue = unitMap[toUnit];

    return value * fromUnitValue! / toUnitValue!;
  }

  static double convertLength(double value, String fromUnit, String toUnit) {
    final lengthUnitMap = {
      'Meter to Kilometer': (double meter) => meter / 1000,
      'Meter to Mile': (double meter) => meter / 1609.34,
      'Meter to Yard': (double meter) => meter * 1.09361,
      'Meter to Foot': (double meter) => meter * 3.28084,
      'Meter to Inch': (double meter) => meter * 39.3701,
      'Kilometer to Meter': (double kilometer) => kilometer * 1000,
      'Kilometer to Mile': (double kilometer) => kilometer / 1.60934,
      'Kilometer to Yard': (double kilometer) => kilometer * 1093.61,
      'Kilometer to Foot': (double kilometer) => kilometer * 3280.84,
      'Kilometer to Inch': (double kilometer) => kilometer * 39370.1,
      'Mile to Meter': (double mile) => mile * 1609.34,
      'Mile to Kilometer': (double mile) => mile * 1.60934,
      'Mile to Yard': (double mile) => mile * 1760,
      'Mile to Foot': (double mile) => mile * 5280,
      'Mile to Inch': (double mile) => mile * 63360,
      'Yard to Meter': (double yard) => yard / 1.09361,
      'Yard to Kilometer': (double yard) => yard / 1093.61,
      'Yard to Mile': (double yard) => yard / 1760,
      'Yard to Foot': (double yard) => yard * 3,
      'Yard to Inch': (double yard) => yard * 36,
      'Foot to Meter': (double foot) => foot / 3.28084,
      'Foot to Kilometer': (double foot) => foot / 3280.84,
      'Foot to Mile': (double foot) => foot / 5280,
      'Foot to Yard': (double foot) => foot / 3,
      'Foot to Inch': (double foot) => foot * 12,
      'Inch to Meter': (double inch) => inch / 39.3701,
      'Inch to Kilometer': (double inch) => inch / 39370.1,
      'Inch to Mile': (double inch) => inch / 63360,
      'Inch to Yard': (double inch) => inch / 36,
      'Inch to Foot': (double inch) => inch / 12,
    };

     final conversionFunction = lengthUnitMap['$fromUnit to $toUnit'];

    if (conversionFunction != null) {
      return conversionFunction(value);
    } else {
      throw Exception('Invalid length conversion: $fromUnit to $toUnit');
    }
  }

  static double convertTemperature(double value, String fromUnit, String toUnit) {
    final temperatureUnitMap = {
      'Celsius to Fahrenheit': (double Celsius) => (Celsius * 9 / 5) + 32,
      'Celsius to Kelvin': (double Celsius) => Celsius + 273.15,
      'Fahrenheit to Celsius': (double Fahrenheit) => (Fahrenheit - 32) * 5 / 9,
      'Fahrenheit to Kelvin': (double Fahrenheit) =>
          (Fahrenheit + 459.67) * 5 / 9,
      'Kelvin to Celsius': (double Kelvin) => Kelvin - 273.15,
      'Kelvin to Fahrenheit': (double Kelvin) => (Kelvin * 9 / 5) - 459.67,
    };

    final conversionFunction = temperatureUnitMap['$fromUnit to $toUnit'];

    if (conversionFunction != null) {
      return conversionFunction(value);
    } else {
      throw Exception('Invalid temperature conversion: $fromUnit to $toUnit');
    }
  }


}