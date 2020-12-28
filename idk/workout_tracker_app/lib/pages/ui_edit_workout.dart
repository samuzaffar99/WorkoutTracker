import 'package:flutter/material.dart';
import '../src/model.dart';

class EditWorkout extends StatefulWidget {
  final User user;
  EditWorkout(this.user);
  @override
  _EditWorkoutState createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF141414),
          appBar: AppBar(
            backgroundColor: Color(0xFF141414),
            title: Text("Summary"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            Navigator.pop(context);

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
              )
            ],
          ),
        ));;
  }
}
