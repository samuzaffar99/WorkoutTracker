import 'package:flutter/material.dart';

class ChooseNewWorkoutPlan extends StatefulWidget {
  @override
  _ChooseNewWorkoutPlanState createState() => _ChooseNewWorkoutPlanState();
}

class _ChooseNewWorkoutPlanState extends State<ChooseNewWorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:Color(0xFF141414) ,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFa43931), Color(0xFF1D4350)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Choose Plan", style: TextStyle(fontSize: 40,color: Colors.white),)
                ]
              ),
            ),
            SizedBox(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 275.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return;
                        //     },
                        //   ),
                        // );
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
                            "Full Body",
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
            ),
            SizedBox(
              height: 75,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 275.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return;
                        //     },
                        //   ),
                        // );
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
                            "At Home",
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
            ),
            SizedBox(
              height: 75,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 275.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return;
                        //     },
                        //   ),
                        // );
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
                            "Split",
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
            )
          ],
        ),
      ),
    ));
  }
}
