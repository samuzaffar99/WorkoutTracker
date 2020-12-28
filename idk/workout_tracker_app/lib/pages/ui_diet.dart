import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import '../src/model.dart';

class DietPage extends StatefulWidget {
  final User user;
  DietPage(this.user);
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Diet"),
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
          child: NavigationBar(index, widget.user),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 400,
                    width: 275,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: 349,
                            child: Card(
                              color: Colors.grey[300],
                              elevation: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "    Banana",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "    \n",
                                              ),
                                              TextSpan(
                                                text: "    Fat\n",
                                              ),
                                              TextSpan(
                                                text: "    Proteins\n",
                                              ),
                                              TextSpan(
                                                text: "    Carbs\n",
                                              ),
                                              TextSpan(
                                                text: "    Calories",
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Amount (g)\n",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: "    31\n",
                                              ),
                                              TextSpan(
                                                text: "    1.5\n",
                                              ),
                                              TextSpan(
                                                text: "    0.4\n",
                                              ),
                                              TextSpan(
                                                text: "    136.2",
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 349,
                            child: Card(
                              color: Colors.grey[300],
                              elevation: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "    Oyesters",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "    \n",
                                              ),
                                              TextSpan(
                                                text: "    Fat\n",
                                              ),
                                              TextSpan(
                                                text: "    Proteins\n",
                                              ),
                                              TextSpan(
                                                text: "    Carbs\n",
                                              ),
                                              TextSpan(
                                                text: "    Calories",
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Amount (g)\n",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: "    4\n",
                                              ),
                                              TextSpan(
                                                text: "    10\n",
                                              ),
                                              TextSpan(
                                                text: "    6\n",
                                              ),
                                              TextSpan(
                                                text: "    100",
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 349,
                            child: Card(
                              color: Colors.grey[300],
                              elevation: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "    Brocolli",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "    \n",
                                              ),
                                              TextSpan(
                                                text: "    Fat\n",
                                              ),
                                              TextSpan(
                                                text: "    Proteins\n",
                                              ),
                                              TextSpan(
                                                text: "    Carbs\n",
                                              ),
                                              TextSpan(
                                                text: "    Calories",
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Amount (g)\n",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: "    0.5\n",
                                              ),
                                              TextSpan(
                                                text: "    4\n",
                                              ),
                                              TextSpan(
                                                text: "    8\n",
                                              ),
                                              TextSpan(
                                                text: "    45",
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
