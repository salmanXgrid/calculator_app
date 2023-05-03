class Calculate {
  /// `[Adds]` the two given Strings/numbers
  double add(String a, String b) => double.parse(a) + double.parse(b);

  /// `[Subtracts]` the two given Strings/numbers
  double subtract(String a, String b) => double.parse(a) - double.parse(b);

  /// `[Multiplies]` the two given Strings/numbers
  double multiply(String a, String b) => double.parse(a) * double.parse(b);

  /// `[Divides]` the two given Strings/numbers
  double divide(String a, String b) => double.parse(a) / double.parse(b);
}
