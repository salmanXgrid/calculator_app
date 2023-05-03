import 'package:flutter/material.dart';

import 'calculate.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _buffer = '';
  String _operator = '';
  bool _isBuffer = true;
  bool _operatorPressed = false;
  Color textColor = Colors.white;
  Color buttonColor = Color.fromARGB(255, 113, 113, 113);
  Color operatorsColor = Color.fromARGB(255, 85, 85, 85);

  void _onDigitPress(String digit) {
    if (_isBuffer) {
      setState(() {
        _buffer += digit;
        _output = _buffer;
        print("in buffer $_buffer");
      });
    } else {
      setState(() {
        // _buffer = digit;
        // _output = _buffer;
        if (_operatorPressed) {
          _output = digit;
          _operatorPressed = false;
        } else {
          _output += digit;
        }

        // _isBuffer = true;
        print(_output);
      });
    }
  }

  void _onOperatorPress(String operator) {
    if (_operator.isEmpty) {
      setState(() {
        _operator = operator;
        _isBuffer = false;
        _operatorPressed = true;
      });
    } else {
      _calculate();
      setState(() {
        _operator = operator;
        _isBuffer = false;
        _operatorPressed = true;
      });
    }
  }

  void _onEqualsPress() {
    _calculate();
    setState(() {
      _operator = '';
      _buffer = '';
      _isBuffer = true;
    });
  }

  /// `[Calculates]` and output the Values
  void _calculate() {
    print("output is $_output");
    print("buffer is $_buffer");
    if (_buffer.isNotEmpty && _operator.isNotEmpty) {
      // TODO: Perform Calculation
      double result = 0;
      switch (_operator) {
        case '+':
          result = Calculate().add(_buffer, _output);
          break;
        case '-':
          result = Calculate().subtract(_buffer, _output);
          break;
        case '*':
          result = Calculate().multiply(_buffer, _output);
          break;
        case '/':
          result = Calculate().divide(_buffer, _output);
          break;
        default:
          return;
      }
      _output = result.toString();
    }
  }

  /// `[Clears]` the Output to 0
  void _onClearPress() {
    setState(() {
      _output = '0';
      _buffer = '';
      _operator = '';
      _isBuffer = true;
    });
  }

  /// Adds the `[Decimal-Point]` to the _output
  void _onDecimalPress() {
    if (!_output.contains('.')) {
      setState(() {
        _output += '.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
        title: Text('Calculator'),
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
                    _output,
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
