import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'dart:convert';

Future<Map> calldb() async {
  // void displayExercise(Map Exercises) {
  //   print(
  //       'Username: ${Users["username"]}, Muscles: ${Exercises["TargetMuscle"]}, Category: ${Exercises["id"]}, Alias: ${Exercises["pop"]}, Difficulty: ${Exercises["Difficulty"]}');
  // }
  //var db = mongo.Db("mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var db = await mongo.Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var Currentuser = db.collection('Users');
  await db.open();
  var username = await Currentuser.findOne(mongo.where.eq('UserID', 'U0002'));
  await db.close();
  return username;
  //return username["Username"];
}

Widget getUsername() {
  return FutureBuilder(
      future: calldb(),
      builder: (buildContext, AsyncSnapshot snapshot) {
        if (snapshot.hasError)
          throw snapshot.error;
        else if (!snapshot.hasData) {
          return Container(
            child: Center(
              //child: Text("Waiting..."),
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Container(
            child: Row(
              children: [
                Text('${snapshot.data["Username"]}'),
                SizedBox(width:2),
                Text('${snapshot.data["Gender"]}'),
              ],
            ),
          );
        }
      });
  // return FutureBuilder(
  //   builder: (context, projectSnap) {
  //     if (projectSnap.connectionState == ConnectionState.none &&
  //         projectSnap.hasData == null) {
  //       //print('project snapshot data is: ${projectSnap.data}');
  //       return Container();
  //     }
  //     return ListView.builder(
  //       itemCount: projectSnap.data.length,
  //       itemBuilder: (context, index) {
  //         ProjectModel project = projectSnap.data[index];
  //         return Column(
  //           children: <Widget>[
  //             // Widget to display the list of project
  //           ],
  //         );
  //       },
  //     );
  //   },
  // );
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFe52165), Color(0xFF0d1137)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      color: Colors.white.withAlpha(190),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0)
                            .copyWith(left: 15, right: 30, top: 25, bottom: 30),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Username",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(30)
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Username',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Password',
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlineButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          //return HomePage();
                                        },
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  color: Colors.transparent,
                                  textColor: Colors.white,
                                  borderSide: BorderSide(
                                      color: Colors.grey.withAlpha(200),
                                      width: 1.25),
                                  highlightedBorderColor: Colors.grey,
                                  // child: Text(
                                  //   "Sign in",
                                  //   style: TextStyle(
                                  //     fontSize: 18,
                                  //     color: Colors.black.withAlpha(230),
                                  //   ),
                                  // ),
                                  child: getUsername(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
