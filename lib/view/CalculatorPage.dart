import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _expression = '';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.bottomRight,
            child: Text(
              _expression,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.bottomRight,
            child: Text(
              _result,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Table(
            children: [
              TableRow(
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('/'),
                ],
              ),
              TableRow(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('*'),
                ],
              ),
              TableRow(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-'),
                ],
              ),
              TableRow(
                children: [
                  _buildButton('.'),
                  _buildButton('0'),
                  _buildButton('00'),
                  _buildButton('+'),
                ],
              ),
              TableRow(
                children: [
                  _buildButton('C'),
                  _buildButton('='),
                  _buildButton('H'),
                  _buildButton('CA'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label) {
    return GestureDetector(
      onTap: () => _handleButtonPressed(label),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void _handleButtonPressed(String label) {
    setState(() {
      switch (label) {
        case 'C':
          _expression = '';
          _result = '';
          break;
        case '=':
          _evaluateExpression();
          break;
        default:
          _expression += label;
      }
    });
  }

  void _evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _result = eval.toString();
    } catch (e) {
      _result = 'Error';
    }
  }
}
