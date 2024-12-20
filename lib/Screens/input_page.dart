import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/Classes/calculator_brain.dart';
import '/Screens/result_page.dart';
import '../Components/resuable_card.dart';
import '../Components/icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void ChangeCardColor(Gender choosenGender) {
    setState(() {
      Selectedgender = choosenGender;
    });
  }

  int height = 180;
  Gender Selectedgender = Gender.None;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ElementContainer(
                      color: Selectedgender == Gender.Male
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      childComponent: CardContentWidget(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                      OnPress: () {
                        ChangeCardColor(Gender.Male);
                      },
                    ),
                  ),
                  Expanded(
                    child: ElementContainer(
                      color: Selectedgender == Gender.Female
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      childComponent: CardContentWidget(
                        icon: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                      OnPress: () {
                        ChangeCardColor(Gender.Female);
                        ;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ElementContainer(
              color: KInactiveCardColor,
              childComponent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "HEIGHT",
                    style: KCardTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: KCardNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: KCardTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFBE1555),
                          trackHeight: 5,
                          overlayColor: Color(0x29BE1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0XFF8D8E98)),
                      child: Slider(
                          min: 120.0,
                          max: 220.0,

                          // activeColor: Color(0xFFBE1555),
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          }))
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ElementContainer(
                    color: KInactiveCardColor,
                    childComponent: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("WEIGHT", style: KCardTextStyle),
                        Text(
                          weight.toString(),
                          style: KCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )),
                            Expanded(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ElementContainer(
                    color: KInactiveCardColor,
                    childComponent: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("AGE", style: KCardTextStyle),
                        Text(
                          age.toString(),
                          style: KCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )),
                            Expanded(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc=CalculatorBrain(weight: weight, height: height);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(bmiRes: calc.calculateBMI(),resultText: calc.getResult(),interpretation: calc.getInterpretation())));
              },
              child: Container(
                color: Color(0xFFBE1555),
                margin: EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                child: Text("CALCULATE",
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

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
