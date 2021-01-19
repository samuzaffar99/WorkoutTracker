import 'package:flutter/material.dart';
import '../src/model.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'ui_workout.dart';

class WorkoutSummary extends StatelessWidget {
  final User user;
  WorkoutSummary(this.user);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF141414),
      appBar: GradientAppBar(
        backgroundColorStart: Color(0xFF1D4350),
        backgroundColorEnd: Color(0xFFa43931),
        elevation: 5,
        title: Text("Summary"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFa43931), Color(0xFF1D4350)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(child: getWorkoutView(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        height: 45.0,
                        minWidth: 160.0,
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'Home', arguments: user);
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
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
