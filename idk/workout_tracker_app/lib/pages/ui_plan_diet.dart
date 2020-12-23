import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_setup_complete.dart';
import 'package:pie_chart/pie_chart.dart';


class PlanDiet extends StatefulWidget {
  @override
  _PlanDietState createState() => _PlanDietState();
}

class _PlanDietState extends State<PlanDiet> {
  bool toggleLactose = false;
  bool toggleSugar = false;
  RangeValues _values = RangeValues(100, 900);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 260,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Plan Diet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                      offset: Offset(1.5, 1.5),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0))
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
        //Insert Pie chart here
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Fat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            Text("|", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            Text("Protein", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            Text("|", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            Text("Carbs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
              trackHeight: 25,
              rangeThumbShape: RoundRangeSliderThumbShape(
                  enabledThumbRadius: 18,
                  pressedElevation: 20,
                  elevation: 30),
              showValueIndicator: ShowValueIndicator.never,
          ),
          child: RangeSlider(
            divisions: 6,
            values: _values,
            min: 0,
            max: 1000,
            labels: RangeLabels('${_values.start.round()}', '${_values.end.round()}'),
            inactiveColor: Colors.white.withAlpha(220),
            activeColor: Colors.white,
            onChanged: (RangeValues values) {
              setState(() {
                _values = values;
              });
            },
          ),
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "   Lactose Free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Switch(
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  activeTrackColor: Colors.green[10],
                  activeColor: Colors.green,
                  value: toggleLactose,
                  onChanged: (value) {
                    setState(() {
                      toggleLactose=value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "   Sugar Free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Switch(
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  activeTrackColor: Colors.green[10],
                  activeColor: Colors.green,
                  value: toggleSugar,
                  onChanged: (value) {
                    setState(() {
                      toggleSugar=value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      height: 45.0,
                      minWidth: 130.0,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SetupComplete();
                              },
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.transparent,
                        textColor: Colors.white,
                        borderSide: BorderSide(
                            color: Colors.white.withAlpha(200), width: 1.25),
                        highlightedBorderColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withAlpha(230),
                                shadows: <Shadow>[
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      blurRadius: 5.0,
                                      color: Color.fromARGB(255, 0, 0, 0))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                ButtonTheme(
                  height: 45.0,
                  minWidth: 130.0,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SetupComplete();
                          },
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.transparent,
                    textColor: Colors.white,
                    borderSide: BorderSide(
                        color: Colors.white.withAlpha(200), width: 1.25),
                    highlightedBorderColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withAlpha(230),
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(1.5, 1.5),
                                  blurRadius: 5.0,
                                  color: Color.fromARGB(255, 0, 0, 0))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
