import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_details.dart';
import '../src/model.dart';
import '../src/api.dart';
import '../others/animated_background.dart';

class SignUpPage extends StatefulWidget {
  final Api _api = Api();
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String username;
  String password;
  String email;
  bool checku = true;
  bool checkm = true;
  var _formKey = GlobalKey<FormState>();
  User user;

  Future<bool> _signupUser() async {
    await widget._api.getUser(username).then(
      (value) {
        print("value is $value");
        setState(
          () {
            user = value;
            print('...$value');
          },
        );
      },
    );
    if (user == null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _signupMail() async {
    await widget._api.getUser(email).then(
      (value) {
        print("value is $value");
        setState(
          () {
            user = value;
            print('...$value');
          },
        );
      },
    );
    if (user == null) {
      return true;
    } else {
      return false;
    }
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
                      alignment: Alignment(0,1.1),
                      children: [
                        Image.asset(
                          'assets/images/pic6.jpg',
                        ),
                        Text(
                          'Create a New Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.white.withAlpha(220),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
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
                                        border: OutlineInputBorder(
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
                                        } else if (checku == false) {
                                          setState(
                                            () {
                                              checku = true;
                                            },
                                          );
                                          return "Username already exists";
                                        }
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
                                        border: OutlineInputBorder(
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
                                          return "This field cannot be left empty";
                                        }
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
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(20)),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        hintText: 'Email',
                                        filled: true,
                                        fillColor: Colors.white.withAlpha(200),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Please enter your email address";
                                        } else if (checkm == false) {
                                          setState(
                                            () {
                                              checkm = true;
                                            },
                                          );
                                          return "Email already exists";
                                        }
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
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                await _signupUser().then(
                                  (value) {
                                    print('$value');
                                    if (value == true) {
                                    } else {
                                      setState(
                                        () {
                                          checku = false;
                                        },
                                      );
                                    }
                                  },
                                );
                                await _signupMail().then(
                                  (value) {
                                    print('$value');
                                    if (value == true) {
                                    } else {
                                      setState(
                                        () {
                                          checkm = false;
                                        },
                                      );
                                    }
                                  },
                                );
                                if (checku == true && checkm == true) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailsPage(username, password, email);
                                      },
                                    ),
                                  );
                                }
                                _formKey.currentState.validate();
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
                                    color: Colors.white.withAlpha(220),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(color: Colors.black.withAlpha(220),fontSize: 16),
                              children: [
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w800),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
