import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
//import '../src/user.dart';
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
        future: _api.getWorkout('5fe0732cb271d358089313e4'),
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
                    onTap: () {}, child: Icon(Icons.dehaze_rounded))),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index, widget.user),
        ),
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
                        alignment: Alignment(10,10),
                          icon: Icon(Icons.pause,color: Colors.white70,),
                          onPressed: (){
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
            Expanded(
              child: getWorkoutView(),
              // child: Opacity(
              //   opacity: 0.5,
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     elevation: 5,
              //     margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 400.0),
              //     child: Padding(
              //       padding: const EdgeInsets.all(15.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Icon(Icons.info_outline_rounded),
              //         ],
              //       )
              //     ),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
