//import 'dart:html';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_home.dart';
import '../src/api.dart';

class SignIn extends StatefulWidget {
  final Api _api = Api();
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username;
  String password;
  bool check = null;
  var _formKey = GlobalKey<FormState>();
  final Api _api = Api();
  // bool _loginUser() {
  //   widget._api.getDriver(username).then((value) {
  //     //sleep(Duration(seconds: 5));
  //     if (value == null) {
  //       print("User Not Found");
  //       check = false;
  //     } else {
  //       //print('mein aage jaarah hun hogaya');
  //       print(value.username);
  //       check = true;
  //     }
  //   });
  // }

  Widget trySignIn() {
    return FutureBuilder(
        future: widget._api.getDriver(username),
        builder: (buildContext, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print('konnichiwa:)');
            throw snapshot.error;
          } else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.data.username == username) {
            return Home();
          } else if (snapshot.data.username == 'default') {
            check = false;
            return SignIn();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF141414),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome Back',
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
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
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
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: 'Username',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Username cannot be left blank";
                                }
                                // else {
                                //   // _formKey.currentState.save();
                                //   // _loginUser();
                                //   // Future.delayed(const Duration(seconds: 2),
                                //   //     () {
                                //   print('value of check is $check');
                                //   // });
                                if (check == false) {
                                  return "invalid user";
                                }
                                //}
                                //check = true;
                                //}
                                //else if (loading == false) {
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
                      children: [
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
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Password cannot be left blank";
                                }
                                //else if (loading == false) {
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

                        //_loginUser();
                        // if (check == false) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) {
                        //         return SignIn();
                        //       },
                        //     ),
                        //   );
                        // }

                        //_formKey.currentState.validate();
                        // _formKey.currentState.save();
                        //print('1');

                        Navigator.popUntil(
                            context, ModalRoute.withName('/ui_home'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return trySignIn();
                            },
                          ),
                        );
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
                          "Log In",
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
                Navigator.pushNamed(context, 'Sign Up');
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
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
