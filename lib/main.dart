import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI_CALCULATOR',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _heightController = TextEditingController();

  final _weightController = TextEditingController();


  double? _bmi;


  String _message = 'Please enter your height and weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);


    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'you are fit and fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            width: 800,
            child: Card(
              color: Colors.white,
              elevation:50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Height (m)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                      ),
                      controller: _weightController,
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Calculate'),
                    ),
                    SizedBox(
                        height: 40
                    ),
                    Container(
                      child: Text(
                        _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                        style: TextStyle(fontSize:30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                        height:40
                    ),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}