import '../widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userQuestion = '';
  String userAnswer = '';

  final List<String> buttons = [
    'AC',
    'DEL',
    ' % ',
    ' / ',
    '9',
    '8',
    '7',
    ' X ',
    '6',
    '5',
    '4',
    ' - ',
    '3',
    '2',
    '1',
    ' + ',
    '0',
    '.',
    'LIGHT',
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
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                  if (index == 0) {
                    return Button(
                      buttonTapped: _allClearPressed,
                      buttonText: buttons[index],
                      color: Colors.redAccent[400],
                      textColor: Colors.white,
                    );
                  }
                  if (index == 1) {
                    return Button(
                      buttonTapped: _deleteButtonPressed,
                      buttonText: buttons[index],
                      color: Colors.orangeAccent[400],
                      textColor: Colors.white,
                    );
                  }
                  if (index == buttons.length - 1) {
                    return Button(
                      buttonTapped: _equalPressed,
                      buttonText: buttons[index],
                      color: Colors.orangeAccent[400],
                      textColor: Colors.white,
                    );
                  }
                  if (index == buttons.length - 2) {
                    return Button(
                      buttonTapped: () {
                        print('theme changer');
                        setState(() {
                          if (buttons[index] == 'LIGHT') {
                            buttons[index] = 'DARK';
                          }
                          if (buttons[index] == 'DARK') {}
                          buttons[index] = 'LIGHT';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.black87,
                      textColor: Colors.white,
                    );
                  } else {
                    return Button(
                      buttonTapped: () => _numberKeyPressed(index),
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
    if (buttonText == ' X ' ||
        buttonText == ' / ' ||
        buttonText == ' - ' ||
        buttonText == ' + ' ||
        buttonText == ' % ' ||
        buttonText == ' = ') {
      return true;
    } else {
      return false;
    }
  }

  _allClearPressed() {
    setState(() {
      userQuestion = '';
      userQuestion = '';
    });
  }

  _equalPressed() {
    String finalQuestion = userQuestion.replaceAll('X', '*');
    ContextModel cm = ContextModel();
    Parser p = Parser();

    Expression exp = p.parse(finalQuestion);
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      userAnswer = eval.toString();
    });
  }

  _deleteButtonPressed() {
    setState(() {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    });
  }

  _numberKeyPressed(int index) {
    setState(() {
      userQuestion += buttons[index];
    });
  }
}
