import 'package:calculatorapp/services/theme_changer.dart';
import 'package:flutter/material.dart';
import 'button_layout.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool darkThemeEnabled = false;
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

  changeTheme() {
    if (darkThemeEnabled) {
      context.read<ThemeChanger>().lightTheme();
      darkThemeEnabled = !darkThemeEnabled;
    } else {
      context.read<ThemeChanger>().darkTheme();
      darkThemeEnabled = !darkThemeEnabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeChanger>().backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            alignment: Alignment.center,
            icon: Icon(Icons.brightness_6),
            onPressed: changeTheme,
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    questionText,
                    style: TextStyle(
                      fontSize: 44.0,
                      color: context.watch<ThemeChanger>().questionColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      answerText,
                      style: TextStyle(
                        fontSize: 42.0,
                        color: context.watch<ThemeChanger>().answerColor,
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
              color: context.watch<ThemeChanger>().keypadColor,
              child: ButtonLayout(
                buttonPressed: buttonPressed,
                numberColor: context.watch<ThemeChanger>().numberColor,
                operatorColor: context.watch<ThemeChanger>().operatorColor,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
