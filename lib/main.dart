// home screen with 3 buttons to navigate to other screens
// back button to go back to home screen

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Assignment 1 - Unit Conversion',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 1 - Unit Conversion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // make button bigger
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Length Conversion'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
            ),
            ElevatedButton(
              // make button bigger
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Weight Conversion'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdRoute()),
                );
              },
            ),
            ElevatedButton(
              // make button bigger
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Temperature Conversion'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// setstate for second route
class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String _input1Value = '';
  String _input2Value = '';
  String _output1Value = '';
  String _output2Value = '';
  String _input1Label = 'Feet';
  String _input2Label = 'Inches';
  String _output1Label = 'Meters';
  String _output2Label = 'Centimeters';
  // bool _isOutputPound = true;

  // input controller
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();

  void _convert() {
    setState(() {
      double output1 = 0.0;
      double output2 = 0.0;
      if (_input1Label == 'Feet' && _input2Label == 'Inches') {
        double feetInput = double.parse(_input1Value);
        double inchInput = double.parse(_input2Value);
        double res = (feetInput * 12 + inchInput) * 2.54;
        int resMeter = res ~/ 100;
        double resCenti = res % 100;
        output1 = double.parse(resMeter.toString());
        output2 = double.parse(resCenti.toStringAsFixed(2));
        _output1Label = 'Meters';
        _output2Label = 'Centimeters';
        _output1Value = output1.toString();
        _output2Value = output2.toString();
      } else {
        double meterInput = double.parse(_input1Value);
        double centiInput = double.parse(_input2Value);
        double res = (meterInput * 100 + centiInput) / 2.54;
        int resFeet = res ~/ 12;
        double resInch = res % 12;
        output1 = double.parse(resFeet.toString());
        output2 = double.parse(resInch.toStringAsFixed(2));
        _output1Label = 'Feet';
        _output2Label = 'Inches';
        _output1Value = output1.toString();
        _output2Value = output2.toString();
      }
    });
  }

  void _swap() {
    setState(() {
      String temp1 = _input1Value;
      String temp2 = _input2Value;
      if (_input1Label == 'Feet' && _input2Label == 'Inches') {
        _input1Label = 'Meters';
        _input2Label = 'Centimeters';
        // _isOutputPound = false;
        _input1Value = _output1Value;
        _input2Value = _output2Value;
        _output1Label = 'Feet';
        _output2Label = 'Inches';
        _output1Value = 0.0.toStringAsFixed(3);
        _output2Value = 0.0.toStringAsFixed(3);
      } else {
        _input1Label = 'Feet';
        _input2Label = 'Inches';
        _input1Value = _output1Value;
        _input2Value = _output2Value;
        _output1Label = 'Meters';
        _output2Label = 'Centimeters';
        // _isOutputPound = true;
        _output1Value = 0.0.toStringAsFixed(3);
        _output2Value = 0.0.toStringAsFixed(3);
      }
      // update input text field
      _input1Controller.text = _input1Value;
      _input2Controller.text = _input2Value;
    });
  }

  // variables for length conversion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Length Conversion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _input1Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    // input controller
                    controller: _input1Controller,
                    onChanged: (text) {
                      setState(() {
                        _input1Value = text;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _input2Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 100.0,
                  child: Visibility(
                    // visible: _isOutputPound,
                    child: TextField(
                      // input controller
                      controller: _input2Controller,
                      onChanged: (text) {
                        setState(() {
                          _input2Value = text;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _output1Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  _output1Value,
                  style: Theme.of(context).textTheme.headline4,
                ),
                // add horizontal padding
                const SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _output2Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Visibility(
                  visible: true,
                  child: Text(
                    _output2Value,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _convert,
                  child: const Text('Convert'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: _swap,
                  child: const Text('Swap'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  child: const Text('HOME'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// setstate for third route
class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  String _input1Value = '';
  String _input2Value = '';
  String _output1Value = '';
  String _output2Value = '';
  String _input1Label = 'Kilogram';
  String _input2Label = 'Gram';
  String _output1Label = 'Pounds';
  String _output2Label = '';
  bool _isOutputPound = true;

  // input controller
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();

  void _convert() {
    setState(() {
      double output1 = 0.0;
      double output2 = 0.0;
      if (_input1Label == 'Kilogram' && _input2Label == 'Gram') {
        double kgInput = double.parse(_input1Value);
        double gInput = double.parse(_input2Value);
        output1 = ((1.0 * kgInput * 1000) + (1.0 * gInput)) / 453.6;
        // output2 = 0.0;
        // _output1Label = 'Pounds';
        // _output2Label = '';
        _output1Value = output1.toStringAsFixed(3);
        // _output2Value = output2.toStringAsFixed(3);
      } else {
        double poundsInput = double.parse(_input1Value);
        double res = poundsInput * 453.6;
        int res_kg = res ~/ 1000;
        double res_g = res % 1000;
        output1 = double.parse(res_kg.toString());
        output2 = res_g;
        // _output1Label = 'Kilogram';
        // _output2Label = 'Gram';
        _output1Value = output1.toStringAsFixed(0);
        _output2Value = output2.toString().substring(0, 3);
      }
    });
  }

  void _swap() {
    setState(() {
      String temp1 = _input1Value;
      String temp2 = _input2Value;
      if (_input1Label == 'Kilogram' && _input2Label == 'Gram') {
        _input1Label = 'Pounds';
        _input2Label = '';
        _isOutputPound = false;
        _input1Value = _output1Value;
        _input2Value = _output2Value;
        _output1Label = 'Kilogram';
        _output2Label = 'Gram';
        _output1Value = 0.0.toStringAsFixed(3);
        _output2Value = 0.0.toStringAsFixed(3);
      } else {
        _input1Label = 'Kilogram';
        _input2Label = 'Gram';
        _input1Value = _output1Value;
        _input2Value = _output2Value;
        _output1Label = 'Pounds';
        _output2Label = '';
        _isOutputPound = true;
        _output1Value = 0.0.toStringAsFixed(3);
        _output2Value = "";
      }
      // update input text field
      _input1Controller.text = _input1Value;
      _input2Controller.text = _input2Value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weight Conversion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _input1Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    // input controller
                    controller: _input1Controller,
                    onChanged: (text) {
                      setState(() {
                        _input1Value = text;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _input2Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 100.0,
                  child: Visibility(
                    visible: _isOutputPound,
                    child: TextField(
                      // input controller
                      controller: _input2Controller,
                      onChanged: (text) {
                        setState(() {
                          _input2Value = text;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _output1Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  _output1Value,
                  style: Theme.of(context).textTheme.headline4,
                ),
                // add horizontal padding
                const SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _output2Label,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Visibility(
                  visible: true,
                  child: Text(
                    _output2Value,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _convert,
                  child: const Text('Convert'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: _swap,
                  child: const Text('Swap'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  child: const Text('HOME'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// setstate for fourth route
class FourthRoute extends StatefulWidget {
  const FourthRoute({super.key});

  @override
  _FourthRouteState createState() => _FourthRouteState();
}

// fourth route
class _FourthRouteState extends State<FourthRoute> {
  String _inputValue = '';
  String _outputValue = '';
  String _inputLabel = 'Fahrenheit';
  String _outputLabel = 'Celsius';

  // input controller
  final TextEditingController _inputController = TextEditingController();

  void _convert() {
    setState(() {
      double input = double.parse(_inputValue);
      double output = 0.0;
      if (_inputLabel == 'Fahrenheit') {
        output = (input - 32) * 5 / 9;
        _outputLabel = 'Celsius';
      } else {
        output = input * 9 / 5 + 32;
        _outputLabel = 'Fahrenheit';
      }
      _outputValue = output.toStringAsPrecision(3);
    });
  }

  void _swap() {
    setState(() {
      String temp = _inputValue;
      _inputValue = _outputValue;
      _outputValue = temp;
      temp = _inputLabel;
      _inputLabel = _outputLabel;
      _outputLabel = temp;
      // update input text field
      _inputController.text = _inputValue;
      // update output text field
      // _outputController.text = _outputValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Conversion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _inputLabel,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    // input controller
                    controller: _inputController,
                    onChanged: (text) {
                      setState(() {
                        _inputValue = text;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _outputLabel,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  _outputValue,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _convert,
                  child: const Text('Convert'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: _swap,
                  child: const Text('Swap'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  child: const Text('HOME'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
