// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import '../lib/calculate.dart';

void main() {
  group('Calculator', () {
    Calculate? calculator;

    setUp(() {
      calculator = Calculate();
    });

    test('Add', () {
      expect(calculator!.add("5", "10"), 15);
      //TODO: Uncomment for making the test Fail
      // expect(calculator!.add("5", "10"), 20);
      expect(calculator!.add("0", "0"), 0);
      expect(calculator!.add("-5", "5"), 0);
    });

    test('Subtract', () {
      expect(calculator!.subtract("10", "5"), 5);
      //TODO: Uncomment for making the test Fail
      // expect(calculator!.subtract("10", "5"), 10);
      expect(calculator!.subtract("0", "0"), 0);
      expect(calculator!.subtract("-5", "5"), -10);
    });

    test('Multiply', () {
      expect(calculator!.multiply("5", "10"), 50);
      //TODO: Uncomment for making the test Fail
      // expect(calculator!.multiply("5", "10"), 20);
      expect(calculator!.multiply("0", "0"), 0);
      expect(calculator!.multiply("-5", "5"), -25);
    });
  });
}
