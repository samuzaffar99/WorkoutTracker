import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_home.dart';
import '../src/api.dart';
import '../src/model.dart';
import '../src/user.dart';
import 'package:crypt/crypt.dart';

class SignIn extends StatefulWidget {
  final Api _api = Api();
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username;
  String password;
  User user;
  bool check = true;
  var _formKey = GlobalKey<FormState>();

  Future<bool> _loginUser() async {
    print('...inside _loginUser');
    await widget._api.getUser(username).then((value) {
      setState(
        () {
          user = value;
          print('set state $value');
        },
      );
    });
    if (user==null) {
      print('user null');
      return false;
    } else {
      print(Crypt(user.password));
      print(password);
      if (Crypt(user.password).match(password)) {
        print('...returning true');
        return true;
      } else {
        print('...returning false');
        return false;
      }
      // if (user.password == password) {
      //   print('...returning true');
      //   return true;
      // } else {
      //   print('...returning false');
      //   return false;
      // }
    }
  }

  User users(User value) => user = value;

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
                                } else if (check == false && user == null) {
                                  setState(
                                    () {
                                      check = true;
                                    },
                                  );
                                  return "Username is incorrect";
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
                                  return "Password cannot be left blank";
                                } else if (check == false && user != null) {
                                  print(user.username);
                                  setState(() {
                                    check = true;
                                  });
                                  return "Password is incorrect";
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
                        await _loginUser().then(
                          (value) {
                            print('$value');
                            if (value == true) {
                              Navigator.popUntil(context, ModalRoute.withName('/ui_home'));
                              Navigator.pushNamed(context, 'Home', arguments: user);
                            } else {
                              setState(() {
                                check = false;
                                _formKey.currentState.validate();
                              });
                            }
                          },
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
