import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import 'package:workout_tracker_app/pages/ui_signin.dart';
import 'package:workout_tracker_app/pages/ui_settings.dart';

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
                    onTap: () {}, child: Icon(Icons.dehaze_rounded))),
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
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 20,),
                CircleAvatar(
                  radius: 54,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "${userDetails.username} ",
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
              ],
            ),
            Opacity(
              opacity: 0.5,
              child: Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 370,
                      child: Column(
                        children: [
                          Row(
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
                                                text:
                                                    "${userDetails.weight} kg\n",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: "BMI",
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Your Goals',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
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
                                                text:
                                                    "${userDetails.weight} kg\n",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                                text: "      22\n",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: "Days Rem",
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '7 Day Streak',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //Navigator.pop(context);
                              //Insert new navigation page here
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'View last session',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.settings),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Settings();
                                      },
                                    ),
                                  );
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Settings();
                                      },
                                    ),
                                  );
                                },
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Settings',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
