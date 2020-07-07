import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final Function buttonTapped;

  const Button(
      {this.color, this.textColor, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: color,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor, fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
