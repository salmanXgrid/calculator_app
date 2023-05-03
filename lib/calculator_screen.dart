import 'package:flutter/material.dart';

import 'calculate.dart';

/// This screen is the View of the Whole Calculator Screen
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // State Variables-----------
  String _value1 = '';
  String _value2 = '0';
  String _operator = '';
  bool _isBuffer = true;
  bool _operatorPressed = false;
  // Color Variables-----------
  Color textColor = Colors.white;
  Color buttonColor = Color.fromARGB(255, 113, 113, 113);
  Color operatorsColor = Color.fromARGB(255, 85, 85, 85);

  /// Adds the `[Digit]` to the _value Variables
  void _onDigitPress(String digit) {
    if (_isBuffer) {
      setState(() {
        _value1 += digit;
        _value2 = _value1;
        print("in Value-1 $_value1");
      });
    } else {
      setState(() {
        // _value1 = digit;
        // _value2 = _value1;
        if (_operatorPressed) {
          _value2 = digit;
          _operatorPressed = false;
        } else {
          _value2 += digit;
        }
        // _isBuffer = true;
        print(_value2);
      });
    }
  }

  /// Adds the `[Operator]` i.e. Add, Subtract, Multiply and Division to the _value2 variable
  void _onOperatorPress(String operator) {
    if (_operator.isEmpty) {
      setState(() {
        _operator = operator;
        _isBuffer = false;
        _operatorPressed = true;
      });
    } else {
      _calculation();
      setState(() {
        _operator = operator;
        _isBuffer = false;
        _operatorPressed = true;
      });
    }
  }

  /// It `[Calculates and Outputs]` the Values depending upon the pressed Operator
  void _onEqualsPress() {
    _calculation();
    setState(() {
      _operator = '';
      _value1 = '';
      _isBuffer = true;
    });
  }

  /// This is the Calculation method
  void _calculation() {
    print("output is $_value2");
    print("Value-1 is $_value1");
    if (_value1.isNotEmpty && _operator.isNotEmpty) {
      // TODO: Perform Calculation
      double result = 0;
      switch (_operator) {
        case '+':
          result = Calculate().add(_value1, _value2);
          break;
        case '-':
          result = Calculate().subtract(_value1, _value2);
          break;
        case '*':
          result = Calculate().multiply(_value1, _value2);
          break;
        case '/':
          result = Calculate().divide(_value1, _value2);
          break;
        default:
          return;
      }
      _value2 = result.toString();
    }
  }

  /// `[Clears]` the Output to 0
  void _onClearPress() {
    setState(() {
      _value2 = '0';
      _value1 = '';
      _operator = '';
      _isBuffer = true;
    });
  }

  /// Adds the `[Decimal-Point]` to the _value2
  void _onDecimalPress() {
    if (!_value2.contains('.')) {
      setState(() {
        if (_isBuffer) {
          _value1 += ".";
        }
        _value2 += '.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 22, 22, 22),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _value2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 36, 36, 36),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         elevation: 0,
                //         shadowColor: Colors.transparent,
                //         primary: buttonColor, // Background color
                //       ),
                //       onPressed: _onClearPress,
                //       child: Text(
                //         'C',
                //         style: TextStyle(
                //           fontSize: 36.0,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //     Spacer(),
                //     // ElevatedButton(
                //     //   style: ElevatedButton.styleFrom(
                //     //     elevation: 0,
                //     //     shadowColor: Colors.transparent,
                //     //     primary: buttonColor, // Background color
                //     //   ),
                //     //   onPressed: () => _onOperatorPress('%'),
                //     //   child: Text(
                //     //     '%',
                //     //     style: TextStyle(
                //     //       fontSize: 36.0,
                //     //       color: Colors.black,
                //     //     ),
                //     //   ),
                //     // ),
                //     Spacer(),
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         elevation: 0,
                //         shadowColor: Colors.transparent,
                //         primary: buttonColor, // Background color
                //       ),
                //       onPressed: () => _onOperatorPress('/'),
                //       child: Text(
                //         '/',
                //         style: TextStyle(
                //           fontSize: 36.0,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('7'),
                      child: Text(
                        '7',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('8'),
                      child: Text(
                        '8',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('9'),
                      child: Text(
                        '9',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: operatorsColor, // Background color
                      ),
                      onPressed: () => _onOperatorPress('*'),
                      child: Text(
                        'x',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('4'),
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('5'),
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('6'),
                      child: Text(
                        '6',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: operatorsColor, // Background color
                      ),
                      onPressed: () => _onOperatorPress('-'),
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('1'),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('2'),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('3'),
                      child: Text(
                        '3',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: operatorsColor, // Background color
                      ),
                      onPressed: () => _onOperatorPress('+'),
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 36.0, color: textColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: () => _onDigitPress('0'),
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: buttonColor, // Background color
                      ),
                      onPressed: _onDecimalPress,
                      child: Text(
                        '.',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: Color.fromARGB(
                            255, 255, 169, 64), // Background color
                      ),
                      onPressed: _onClearPress,
                      child: Text(
                        'C',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        primary: operatorsColor, // Background color
                      ),
                      onPressed: _onEqualsPress,
                      child: Text(
                        '=',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
