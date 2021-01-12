import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import 'package:workout_tracker_app/pages/ui_edit_workout.dart';
import 'package:workout_tracker_app/pages/ui_in_workout.dart';
import '../src/model.dart';
import '../src/api.dart';
import 'package:intl/intl.dart';

class WorkoutPage extends StatefulWidget {
  final User user;
  WorkoutPage(this.user);
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final Api _api = Api();
  //@override
  Widget getWorkoutView() {
    return FutureBuilder(
        future: _api.getWorkout(widget.user.currWorkout),
        builder: (buildContext, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            throw snapshot.error;
          else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            String wday =
                "Tuesday"; //var date = DateTime.now();print(DateFormat('EEEE').format(date));
            int dindex = 0;
            for (var i = 0; i < snapshot.data["days"].length; i++) {
              if (snapshot.data["days"][i]["day"] == wday) {
                print(snapshot.data["days"][i]["day"]);
                dindex = i;
                break;
              }
            }
            print(snapshot.data);
            print(
                'Num exercises: ${snapshot.data["days"][dindex]["routine"].length}');
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data["days"][dindex]["day"],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                            snapshot.data["days"][dindex]["routine"].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var currentItem =
                              snapshot.data["days"][dindex]["routine"][index];
                          print(
                              'ExerciseId: ${currentItem["exid"].runtimeType}');
                          print('ExerciseId: ${currentItem["exid"]}');
                          return Card(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                Text('ExerciseId : ${currentItem["exid"]}'),
                                FutureBuilder(
                                    future:
                                        _api.getExercise(currentItem["exid"]),
                                    builder:
                                        (buildContext, AsyncSnapshot snapshot) {
                                      if (snapshot.hasError) {
                                        throw snapshot.error;
                                      } else if (!snapshot.hasData) {
                                        return Container(
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        print(snapshot.data);
                                        switch (snapshot.data["category"]) {
                                          case "strength":
                                            {
                                              return Column(
                                                children: [
                                                  Text(snapshot.data["name"]),
                                                  if (snapshot.data["info"] !=
                                                      null)
                                                    Text(snapshot.data["info"]),
                                                  ListView.builder(
                                                      itemCount:
                                                          currentItem["reps"]
                                                              .length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index2) {
                                                        var currentItem2 =
                                                            currentItem["reps"]
                                                                [index2];
                                                        return Text(
                                                            "Reps: $currentItem2");
                                                      }),
                                                ],
                                              );
                                            }
                                          case "endurance":
                                            {
                                              return Column(
                                                children: [
                                                  Text(snapshot.data["name"]),
                                                  if (snapshot.data["info"] !=
                                                      null)
                                                    Text(snapshot.data["info"]),
                                                  ListView.builder(
                                                      itemCount:
                                                          currentItem["dur"]
                                                              .length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index2) {
                                                        var currentItem2 =
                                                            currentItem["dur"]
                                                                [index2];
                                                        return Text(
                                                            "Duration: $currentItem2");
                                                      }),
                                                ],
                                              );
                                            }
                                        }
                                        return Text(
                                            "Invalid Exercise Category!");
                                      }
                                    }),
                              ]));
                        }),
                  )
                ]);
          }
        });
  }

  Widget workoutCard()
  {
    return Container(
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
                        text: "    Exercise",
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
                          text: "    Reps\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: "      1\n",
                        ),
                        TextSpan(
                          text: "      1\n",
                        ),
                        TextSpan(
                          text: "      1\n",
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
                  width: 50,
                ),
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Difficulty\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          text: "10.0\n",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Workout"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditWorkout(widget.user);
                      }));
                    },
                    child: Icon(Icons.edit))),
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
          child: ListView(
            children: [
              // Expanded(
              //   child:getWorkoutView(),
              // ),
              Opacity(
                opacity: 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
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
                            //get number of exercises for this person and
                            //iterate each using a for loop
                            //get respective data according to the iteration number/id
                            workoutCard(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    height: 45.0,
                    minWidth: 160.0,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InWorkout(widget.user);
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
                            "Start Workout",
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
      ),
    );
  }
}
