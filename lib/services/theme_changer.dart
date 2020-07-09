import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  //main
  // keypad
  Color darkKeypadColour = Color.fromRGBO(15, 76, 117, 1);
  Color lightKeypadColour = Colors.grey[200];

  //background
  Color lightBackgroundColour = Colors.grey[100];
  Color darkBackgroundColour = Color.fromRGBO(27, 38, 44, 1);

  // layout (question and answer)
  Color lightAnswerColour = Colors.grey[500];
  Color lightQuestionColour = Color.fromRGBO(67, 84, 188, 1);

  Color darkAnswerColour = Color.fromRGBO(50, 130, 184, 1);
  Color darkQuestionColour = Color.fromRGBO(187, 225, 250, 1);

  // buttons
  Color lightNumberColour = Colors.black45;
  Color lightOperatorColour = Color.fromRGBO(67, 84, 188, 1);

  Color darkNumberColour = Color.fromRGBO(187, 225, 250, 1);
  Color darkOperatorColour = Color.fromRGBO(50, 130, 184, 1);

  // The color that will be passed throught getter

  Color _answerColor = Colors.grey[500];
  Color _questionColor = Color.fromRGBO(67, 84, 188, 1);

  Color _numberColor = Colors.black45;
  Color _operatorColor = Color.fromRGBO(67, 84, 188, 1);

  Color _keypadColor = Colors.grey[200];
  Color _backgroundColor = Colors.grey[100];

  Color get answerColor => _answerColor;
  Color get questionColor => _questionColor;
  Color get numberColor => _numberColor;
  Color get operatorColor => _operatorColor;
  Color get keypadColor => _keypadColor;
  Color get backgroundColor => _backgroundColor;

  void darkTheme() {
    _answerColor = darkAnswerColour;
    _questionColor = darkQuestionColour;
    _numberColor = darkNumberColour;
    _operatorColor = darkOperatorColour;
    _keypadColor = darkKeypadColour;
    _backgroundColor = darkBackgroundColour;

    notifyListeners();
  }

  void lightTheme() {
    _answerColor = lightAnswerColour;
    _questionColor = lightQuestionColour;
    _numberColor = lightNumberColour;
    _operatorColor = lightOperatorColour;
    _keypadColor = lightKeypadColour;
    _backgroundColor = lightBackgroundColour;

    notifyListeners();
  }
}
