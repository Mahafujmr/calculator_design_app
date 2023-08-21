import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
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

  void _onNumberButtonPressed(String value) {
    setState(() {
      _currentInput += value;
    });
  }

  void _onClearButtonPressed() {
    setState(() {
      _currentInput = '';
    });
  }

  void _onCalculateButtonPressed() {
    // Add your calculation logic here
    // For this example, let's just clear the input
    _onClearButtonPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _currentInput,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
              _buildActionButton('C', _onClearButtonPressed),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
              _buildActionButton('/', () => _onNumberButtonPressed('/')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
              _buildActionButton('*', () => _onNumberButtonPressed('*')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNumberButton('0'),
              _buildActionButton('+', () => _onNumberButtonPressed('+')),
              _buildActionButton('-', () => _onNumberButtonPressed('-')),
              _buildActionButton('=', _onCalculateButtonPressed),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String value) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onNumberButtonPressed(value),
        child: Text(value),
      ),
    );
  }

  Widget _buildActionButton(String value, Function onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(primary: Colors.orange),
        child: Text(value, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
