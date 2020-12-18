import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_choose_plan.dart';
import 'dart:async';

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  DateTime _dateTime;

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
            'Set Goals',
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
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withAlpha(200),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: DropdownButton(
                      items: <String>['Male', 'Female', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Weight',
                        filled: true,
                        fillColor: Colors.white.withAlpha(200),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'BodyFat',
                        filled: true,
                        fillColor: Colors.white.withAlpha(200),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
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
                              return ChoosePlan();
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChoosePlan();
                    }));
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
    ));
  }
}
