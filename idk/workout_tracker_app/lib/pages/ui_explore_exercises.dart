import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_exercise_results.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ExploreExercises extends StatefulWidget {
  @override
  _ExploreExercisesState createState() => _ExploreExercisesState();
}

class _ExploreExercisesState extends State<ExploreExercises> {
  bool toggleCardio = false;
  bool toggleEquipment = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: GradientAppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColorStart: Color(0xFF1D4350),
          backgroundColorEnd: Color(0xFFa43931),
          elevation: 5,
          title: Text("Explore"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {}, child: Icon(Icons.dehaze_rounded))),
          ],
        ),
        body: Container(
           decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFa43931), Color(0xFF1D4350)])),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.white.withAlpha(200),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 150.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ExerciseResults();
                          },
                        ));
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
                            "Search",
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: 'Muscle Group',
                          filled: true,
                          fillColor: Colors.white.withAlpha(200),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "        Cardio",
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
                    value: toggleCardio,
                    onChanged: (value) {
                      setState(() {
                        toggleCardio = value;
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
                        "        No Equipment",
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
                    value: toggleEquipment,
                    onChanged: (value) {
                      setState(() {
                        toggleEquipment = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: 'Sort By',
                          filled: true,
                          fillColor: Colors.white.withAlpha(200),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
