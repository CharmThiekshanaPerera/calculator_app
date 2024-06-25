import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _input = "";
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "";
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);

      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operator == "×") {
        _output = (_num1 * _num2).toString();
      } else if (_operator == "÷") {
        _output = (_num1 / _num2).toString();
      }

      _num1 = 0;
      _num2 = 0;
      _operator = "";
      _input = _output;
    } else {
      _input += buttonText;
      _output = _input;
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.blueGrey),
                  _buildButton("8", Colors.blueGrey),
                  _buildButton("9", Colors.blueGrey),
                  _buildButton("÷", const Color.fromARGB(255, 255, 115, 0)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.blueGrey),
                  _buildButton("5", Colors.blueGrey),
                  _buildButton("6", Colors.blueGrey),
                  _buildButton("×", const Color.fromARGB(255, 255, 115, 0)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.blueGrey),
                  _buildButton("2", Colors.blueGrey),
                  _buildButton("3", Colors.blueGrey),
                  _buildButton("-", const Color.fromARGB(255, 255, 115, 0)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton(".", Colors.blueGrey),
                  _buildButton("0", Colors.blueGrey),
                  _buildButton("00", Colors.blueGrey),
                  _buildButton("+", const Color.fromARGB(255, 255, 115, 0)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C", Colors.redAccent),
                  _buildButton("=", const Color.fromARGB(255, 3, 126, 66)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
