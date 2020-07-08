import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  final Function buttonPressed;

  ButtonLayout({this.buttonPressed});

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
            (MediaQuery.of(context).size.height * 0.47),
      ),
      itemBuilder: (context, index) {
        return MaterialButton(
          child: Text(
            buttons[index],
            style: TextStyle(
              fontSize: isOperator(buttons[index]) ? 24.0 : 22.0,
              color: isOperator(buttons[index]) ? Colors.blue : Colors.black,
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
