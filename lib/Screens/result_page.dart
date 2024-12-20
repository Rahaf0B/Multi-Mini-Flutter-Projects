import 'package:flutter/material.dart';
import '/Components/resuable_card.dart';

import '../utilities/constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.bmiRes,required this.resultText, required this.interpretation,Key? key}) : super(key: key);
  final String bmiRes;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
              flex: 5,
              child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: ElementContainer(
                    color: KActiveCardColor,
                    childComponent: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          resultText,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          bmiRes,
                          style: KCardNumberStyle,
                        ),
                        Text(
                          interpretation,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context   );
              },
              child: Container(
                color: Color(0xFFBE1555),
                margin: EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                child: Text("RE-CALCULATE",
                    style: TextStyle(
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
            )
          ],
        ));
  }
}
