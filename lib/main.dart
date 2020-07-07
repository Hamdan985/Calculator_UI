import 'package:flutter/material.dart';
// import './screens/calculator_screen.dart';
import 'CalculatorScreen.dart';
import 'Button.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
