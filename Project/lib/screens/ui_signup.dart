
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

Future<Map> getUserExist(String user) async {
  var db = await mongo.Db.create(
      "mongodb+srv://Admin:admin@cluster0.ejodh.mongodb.net/WorkoutTracker");
  var currentUser = db.collection('Users');
  await db.open();
  var username = await currentUser.findOne(mongo.where.eq('Username', user));
  await db.close();
  return username;
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _formKey = GlobalKey<FormState>();

  final controllerUN = TextEditingController();
  final controllerPW = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerUN.dispose();
    controllerPW.dispose();
    super.dispose();
  }

  Widget trySignUp() {
    return FutureBuilder(
        future: getUserExist(controllerUN.text),
        builder: (buildContext, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            throw snapshot.error;
          else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.data["Username"] == controllerUN.text) {
            return Container(
              child: Center(
                child: Text("User Already Exists"),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text("Success"),
              ),
            );
          }
        });
  }

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
                                    controller: controllerUN,
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
                              obscureText: true,
                              controller: controllerPW,
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
                                          return trySignUp();
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
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withAlpha(230),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
