import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    int index = 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Profile"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.settings),
                )),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              '<name>',
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
            SizedBox(height: 20),
            Opacity(
              opacity: 0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 75,
                        width: 100,
                        child: Card(
                          color: Colors.grey[300],
                          elevation: 10,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "80.0 kg\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: "Weight",
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        child: Card(
                          color: Colors.grey[300],
                          elevation: 10,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "15.0 %\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: "BodyFat",
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 100,
                        child: Card(
                          color: Colors.grey[300],
                          elevation: 10,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "22.0\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: "FMI",
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
