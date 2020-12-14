import 'package:flutter/material.dart';

class ChoosePlan extends StatefulWidget {
  @override
  _ChoosePlanState createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  List<bool> isSelected = List.generate(7, (_) => false);
  List<bool> isSelected2 = List.generate(3, (_) => false);

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
              'Select a Training Plan',
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 10,
                  child: ToggleButtons(
                    children: [
                      OutlineButton(
                        child: Text("M", style: TextStyle(color: Colors.white.withAlpha(200),)),
                        onPressed: null,
                      ),
                      OutlineButton(
                        child: Text("T", style: TextStyle(color: Colors.white.withAlpha(200))),
                        onPressed: null,
                      ),
                      OutlineButton(
                        child: Text("W", style: TextStyle(color: Colors.white.withAlpha(200))),
                        onPressed: null,
                      ),
                      OutlineButton(
                        child: Text("T", style: TextStyle(color: Colors.white.withAlpha(200))),
                        onPressed: null,
                      ),
                      OutlineButton(
                        child: Text("F", style: TextStyle(color: Colors.white.withAlpha(200))),
                        onPressed: null,
                      ),
                      OutlineButton(
                        child: Text("S", style: TextStyle(color: Colors.white.withAlpha(200))),
                        onPressed: null,
                      ),
                      OutlineButton(
                        child: Text("S", style: TextStyle(color: Colors.white.withAlpha(200))),
                        onPressed: null,
                      ),
                    ],
                    selectedBorderColor: Colors.white.withAlpha(200),
                    borderColor: Colors.white.withAlpha(200),
                    color: Colors.white.withAlpha(200),
                    selectedColor: Colors.white.withAlpha(200),
                    isSelected: isSelected,
                    onPressed: (int index) {
                      setState(
                        () {
                          for (int indexBtn = 0;
                              indexBtn < isSelected.length;
                              indexBtn++) {
                            if (indexBtn == index) {
                              isSelected[indexBtn] = true;
                            } else {
                              isSelected[indexBtn] = false;
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: ToggleButtons(
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: OutlineButton(
                          child: Text("Home Exercise", style: TextStyle(color: Colors.white.withAlpha(200))),
                          onPressed: null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: OutlineButton(
                          child: Text("Power Lifting", style: TextStyle(color: Colors.white.withAlpha(200))),
                          onPressed: null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: OutlineButton(
                          child: Text("Body Building", style: TextStyle(color: Colors.white.withAlpha(200)),),
                          onPressed: null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                    selectedBorderColor: Colors.white.withAlpha(200),
                    borderColor: Colors.white.withAlpha(200),
                    selectedColor: Colors.white,
                    isSelected: isSelected2,
                    onPressed: (int index) {
                      setState(
                        () {
                          for (int indexBtn = 0;
                              indexBtn < isSelected2.length;
                              indexBtn++) {
                            if (indexBtn == index) {
                              isSelected2[indexBtn] = true;
                            } else {
                              isSelected2[indexBtn] = false;
                            }
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      height: 45.0,
                      minWidth: 170.0,
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
                  width: 30,
                ),
                ButtonTheme(
                  height: 45.0,
                  minWidth: 170.0,
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
      ),
    );
  }
}
