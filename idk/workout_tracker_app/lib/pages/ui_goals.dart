import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_choose_plan.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import '../others/animated_background.dart';


class WorkoutGoals extends StatefulWidget {
  @override
  _WorkoutGoalsState createState() => _WorkoutGoalsState();
}

class _WorkoutGoalsState extends State<WorkoutGoals> {
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('dd/MM/yyyy');
  var myController;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    setState(() {
      myController =
          TextEditingController(text: '${myFormat.format(selectedDate)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF141414),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(child: AnimatedBackground()),
            onBottom(AnimatedWave(
              height: 180,
              speed: 1,
            )),
            onBottom(AnimatedWave(
              height: 120,
              speed: 0.9,
              offset: 3.142,
            )),
            onBottom(AnimatedWave(
              height: 220,
              speed: 1.2,
              offset: 3.142 / 2,
            )),
            Positioned.fill(child: Center()),
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment(0,1.3),
                    children: [
                      Image.asset(
                        'assets/images/pic6.jpg',
                      ),
                      Text(
                        'Set Goals',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white.withAlpha(220),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: InkWell(
                              onTap: () => _selectDate(context),
                              child: IgnorePointer(
                                child: TextFormField(
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: 'Target Date',
                                    filled: true,
                                    fillColor: Colors.white.withAlpha(200),
                                  ),
                                  controller: myController,
                                ),
                              ),
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
                                hintText: 'Weight (kg)',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
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
                                hintText: 'BodyFat (%)',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                              textColor: Colors.white.withAlpha(200),
                              borderSide: BorderSide(
                                  color: Colors.white.withAlpha(200), width: 1.25),
                              highlightedBorderColor: Colors.white.withAlpha(200),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Skip",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white.withAlpha(230),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 22,
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
                          textColor: Colors.white.withAlpha(200),
                          borderSide: BorderSide(
                              color: Colors.white.withAlpha(200), width: 1.25),
                          highlightedBorderColor: Colors.white.withAlpha(200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white.withAlpha(230),
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
          ],
        ),
      ),
    ));
  }
}
