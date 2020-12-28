import 'package:flutter/material.dart';
import 'ui_workout_summary.dart';
import '../src/model.dart';

class InWorkout extends StatefulWidget {
  final User user;
  InWorkout(this.user);
  @override
  _InWorkoutState createState() => _InWorkoutState();
}

class _InWorkoutState extends State<InWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white70, shape: BoxShape.circle),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "     00:00",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                        ),
                      ),
                      IconButton(
                          color: Colors.white70,
                          alignment: Alignment(10, 10),
                          icon: Icon(
                            Icons.pause,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            print("done");
                          }),
                    ],
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  height: 45.0,
                  minWidth: 160.0,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/ui_workout_summary'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WorkoutSummary(widget.user);
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
                          "End Workout",
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
