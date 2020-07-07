import 'package:flutter/material.dart';
import 'CalculatorScreen.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  Button({this.buttonText, this.onTap});

  bool isOperator(buttonText) {
    if (buttonText == 'DEL' ||
        buttonText == '/' ||
        buttonText == 'X' ||
        buttonText == '+') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(buttonText);
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: isOperator(buttonText) ? Colors.blue[800] : Colors.blue,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
