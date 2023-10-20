import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double val = 0;
  int groupValue = 0;
  String finalAnswer = '';

  handleTemperature(int value) {
    setState(() {
      if (value == 1) {
        setState(() {
          groupValue = 1;
          var ans = (val - 32.0) / 1.8;
          finalAnswer = ans.toString() + " C";
        });
      } else if (value == 2) {
        setState(() {
          groupValue = 2;
          var ans = (val * 1.8) + 32;
          finalAnswer = ans.toString() + " F";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter value'),
            onChanged: (String value) {
              if (value.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid number")));
                finalAnswer = '';
                return;
              } else {
                setState(() {
                  val = double.parse(value);
                  handleTemperature(groupValue);
                });
              }
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.red,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => handleTemperature(e!)),
              Text("Fahrenheit To Celsius"),
              SizedBox(
                height: 5.0,
              ),
              Radio(
                  activeColor: Colors.red,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (e) => handleTemperature(e!)),
              Text("Celsius To Fahrenheit"),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          TextButton(
            child: Text('Clear'),
            onPressed: () {
              setState(() {
                finalAnswer = '';
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(finalAnswer == '' ? '' : finalAnswer)
        ],
      ),
    );
  }
}
