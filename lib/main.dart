import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _currentInput = '';
  String _output = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        try {
          _output = _evaluateExpression();
        } catch (e) {
          _output = 'Error';
        }
        _currentInput = '';
      } else if (value == 'C') {
        _currentInput = '';
        _output = '';
      } else {
        _currentInput += value;
      }
    });
  }

  String _evaluateExpression() {
    String expression = _currentInput;
    // Add your evaluation logic here, or use a library like 'math_expressions'
    // For this example, we'll just use the 'eval' function from 'dart:math'
    return '${double.parse(expression)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modern Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _currentInput,
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                _buildRow(['7', '8', '9', '/']),
                _buildRow(['4', '5', '6', '*']),
                _buildRow(['1', '2', '3', '-']),
                _buildRow(['C', '0', '=', '+']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((button) {
          return Expanded(
            child: InkWell(
              onTap: () => _onButtonPressed(button),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Center(
                  child: Text(
                    button,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
