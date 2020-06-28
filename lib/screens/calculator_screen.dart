import '../widgets/button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * 0.53),
                ),
                itemBuilder: (BuildContext context, int index) {
                  if(index == 0 || index == 1){
                    return Button(
                    buttonText: buttons[index],
                    color: Colors.redAccent[400],
                    textColor: Colors.white,
                  );
                  }
                  else {
                    return Button(
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? Colors.yellow[700]
                        : Colors.grey[800],
                    textColor: Colors.white,
                  );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String buttonText) {
    if (buttonText == 'X' ||
        buttonText == '/' ||
        buttonText == '-' ||
        buttonText == '+' ||
        buttonText == '%' ||
        buttonText == '=') {
      return true;
    } else {
      return false;
    }
  }
}
