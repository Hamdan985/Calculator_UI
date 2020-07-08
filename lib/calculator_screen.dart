import 'package:flutter/material.dart';
import 'button_layout.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String questionText = '';
  String answerText = '';

  bool isOperator(String button) {
    if (button == 'AC' ||
        button == ' % ' ||
        button == ' ^ ' ||
        button == ' X ' ||
        button == ' / ' ||
        button == ' - ' ||
        button == ' + ' ||
        button == '=') {
      return true;
    }
    return false;
  }

  void buttonPressed(String button) {
    if (button == '=') {
      calculateAnswer(questionText);
    } else if (button == 'AC') {
      setState(() {
        questionText = '';
        answerText = '';
      });
    } else if (button == 'DEL') {
      setState(() {
        if (questionText.endsWith(' ')) {
          questionText = questionText.substring(0, questionText.length - 2);
        }
        questionText = questionText.substring(0, questionText.length - 1);
      });
    } else {
      setState(() {
        questionText += button;
      });
    }
  }

  calculateAnswer(String questionText) {
    String finalQuestion = questionText.replaceAll(' X ', '*');
    ContextModel cm = ContextModel();
    Parser p = Parser();

    try {
      Expression exp = p.parse(finalQuestion);
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      print(eval.toString());

      setState(() {
        answerText = eval.toString();
      });
    } catch (e) {
      print(e);
      setState(() {
        answerText = 'Invalid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              color: Colors.grey[190],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    questionText,
                    style: TextStyle(
                      fontSize: 44.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      answerText,
                      style: TextStyle(
                        fontSize: 42.0,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              color: Colors.white70,
              child: ButtonLayout(buttonPressed: buttonPressed),
            ),
          ),
        ],
      )),
    );
  }
}
