//import 'dart:html';

import 'package:flutter_application_07/bottom_button.dart';
import 'package:flutter_application_07/calculation_brain.dart';
import 'package:flutter_application_07/result_page.dart';
import 'package:flutter_application_07/reusable_card.dart';
import 'package:flutter_application_07/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 120; //adamdin boyu
  int weight = 50; //adamdin salmagy
  int age = 18; //adamdin jash
  Gender gender;

  get kActiveCardColour => null;

  get kInactiveCardColour => null;

  Widget cmText = const Text(
    'cm',
    style: TextStyle(
      fontSize: 22.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //backgroundColor: const Color(0xff0b0e21),
        //elevation: 0,
        title: Text(
          'BMI Calculator'.toUpperCase(),
        ),
        //centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    bgColor: gender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    // ignore: prefer_const_constructors
                    child: iconContent(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    bgColor: gender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: iconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              bgColor: kCardBGColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('height(бойу)'.toUpperCase()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.toString()}',
                        style: kHeightTextStyle,
                      ),
                      cmText,
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kRed,
                      inactiveTrackColor: Colors.white,
                      thumbColor: kRed,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 18.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      // activeColor: Colors.red,
                      // inactiveColor: Colors.white,
                      min: 50.0,
                      max: 250.0,
                      value: height.toDouble(),
                      onChanged: (value) {
                        print('san: $value');
                        height = value.toInt();
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColor: kCardBGColor,
                    child: WeightAgeWidget(
                      isCm: true,
                      minus: () {
                        weight--;
                        setState(() {});
                      },
                      plus: () {
                        weight++;
                        setState(() {});
                      },
                      text: 'WEIGHT(салмагы)',
                      number: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColor: kCardBGColor,
                    child: WeightAgeWidget(
                      minus: () {
                        age--;
                        setState(() {});
                      },
                      plus: () {
                        age++;
                        setState(() {});
                      },
                      text: 'AGE(жашы)',
                      number: age,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(
                height: height,
                weight: weight,
              );
              final result = calculatorBrain.calculateBMI();

              print('result: $result');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculatorBrain.calculateBMI(),
                    resultText: calculatorBrain.getResult(),
                    interpretation: calculatorBrain.getInterpretation(),
                  ),
                ),
              );
            },
            buttonTitle: 'SEE RESULT',
          )
        ],
      ),
    );
  }

  Container _buildContainer2() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

enum Gender { male, female }// TODO Implement this library.