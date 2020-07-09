import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  final Function buttonPressed;

  final Color operatorColor;
  final Color numberColor;

  ButtonLayout({this.buttonPressed, this.operatorColor, this.numberColor});

  final List<String> buttons = [
    'AC',
    ' % ',
    ' ^ ',
    ' X ',
    '7',
    '8',
    '9',
    ' / ',
    '4',
    '5',
    '6',
    ' - ',
    '1',
    '2',
    '3',
    ' + ',
    '.',
    '0',
    'DEL',
    '='
  ];

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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: buttons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height * 0.445),
      ),
      itemBuilder: (context, index) {
        return MaterialButton(
          // color: Colors.lightGreenAccent,
          child: Text(
            buttons[index],
            style: TextStyle(
              fontSize: 24.0,
              color: isOperator(buttons[index]) ? operatorColor : numberColor,
              fontFamily: 'VarelaRound-Regular',
            ),
          ),
          onPressed: () {
            buttonPressed(buttons[index]);
          },
        );
      },
    );
  }
}
