import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'Button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final List<String> buttons = [
    '7',
    '8',
    '9',
    'DEL',
    '4',
    '5',
    '6',
    '/',
    '1',
    '2',
    '3',
    'X',
    '.',
    '0',
    '=',
    '+'
  ];

  final String question = '5+9+6+500';
  final String answer = '8';

  buttonPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.looks_3,
                  //     size: 25.0,
                  //   ),
                  //   color: Colors.white,
                  // ),
                  Text(question),
                  Text(answer),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                // color: Colors.blue[500],
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 0.536),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Button(
                        buttonText: buttons[index],
                        onTap: buttonPressed,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
