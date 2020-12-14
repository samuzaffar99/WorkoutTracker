import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_details.dart';
//import '../src/api.dart';
import '../src/model.dart';

class SignUp extends StatefulWidget {
  //final Api _api = Api();
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username;
  String password;
  String email;
  //bool loading = false;
  var _formKey = GlobalKey<FormState>();

  List drivers = [];
  String fetch;

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
            Text(
              'Create a New Account',
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
              height: 5,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        IconTheme(
                          child: Icon(Icons.person),
                          data: IconThemeData(color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    )),
                                hintText: 'Username',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Username cannot be left blank";
                                } //else if (loading == false) {
                                //   return "Name already exists";
                                // }
                                return null;
                              },
                              onSaved: (value) {
                                username = value;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        IconTheme(
                          child: Icon(Icons.lock),
                          data: IconThemeData(color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    )),
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "This field cannot be left empty";
                                } //else if (loading == false) {
                                //   return "Name already exists";
                                // }
                                return null;
                              },
                              onSaved: (value) {
                                password = value;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        IconTheme(
                          child: Icon(Icons.mail),
                          data: IconThemeData(color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    )),
                                hintText: 'Email',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your email address";
                                } //else if (loading == false) {
                                //   return "Name already exists";
                                // }
                                return null;
                              },
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  height: 45.0,
                  minWidth: 200.0,
                  child: OutlineButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Details(username, password, email);
                        }));
                      }
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
                          "Sign Up",
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
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: ' Sign In',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
