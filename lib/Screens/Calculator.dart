
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'input_page.dart';
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:  ThemeData.dark(
      ).copyWith(
        primaryColor: KPrimaryColor,
        scaffoldBackgroundColor: KPrimaryColor
      ),
      home: InputPage(),
    );
  }
}
