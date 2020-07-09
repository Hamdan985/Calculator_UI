import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'services/theme_changer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger()),
    ],
    child: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'VarelaRound-Regular',
      ),
      home: CalculatorScreen(),
    );
  }
}
