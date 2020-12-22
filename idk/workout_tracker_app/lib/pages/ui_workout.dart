import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import 'package:workout_tracker_app/user_data.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  Widget trySignIn() {
    return FutureBuilder(
        future: getWorkout('5fe0732cb271d358089313e4'),
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
            //print(snapshot);
            print(snapshot.data);
            print(snapshot.data);
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data["days"][0]["day"],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            );
          }
          //  else if (snapshot.data["Username"] == controllerUN.text) {
          //   return DietScreen();
          // } else if (snapshot.data["Username"] == null) {
          //   return Container(
          //     child: Center(
          //       child: Text("Wrong User"),
          //     ),
          //   );
          // }
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
          child: NavigationBar(index),
        ),
        body: Column(
          children: [
            Expanded(
              child: trySignIn(),
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
