import 'package:flutter/material.dart';
import 'dart:async';
import 'package:workout_tracker_app/pages/ui_goals.dart';
import '../src/api.dart';
import '../src/model.dart';

class Details extends StatefulWidget {
  String username;
  String password;
  String email;
  final Api _api = Api();
  Details(this.username, this.password, this.email);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //final Api _api = Api();
  DateTime _dateTime;
  // String username;
  // String password;
  // String email;
  String gender;
  String weight;
  String height;
  String date;

  //_DetailsState(String username, String password, String email) : super(username,password,email);

  var _formKey = GlobalKey<FormState>();

  void _registerUser() {
    // print("inside regerster user");
    Driver newDriver = Driver.fromJson({
      'username': widget.username,
      'password': widget.password,
      'email': widget.email,
      'gender': gender,
      'weight': weight,
      'height': height,
      'date': date
    });
    //print('...${newDriver.name}');
    widget._api.postDriver(newDriver).then(
      (value) {
        //print(value.username);
      },
    );
    return;
  }

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
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter Details',
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
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(200),
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: DropdownButton(
                              items: <String>['Male', 'Female', 'Other']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String data) {
                                setState(() {
                                  gender = data;
                                });
                                //gender = value;
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
                                  ),
                                ),
                                hintText: 'Weight',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your weight";
                                } //else if (loading == false) {
                                //   return "Name already exists";
                                // }
                                return null;
                              },
                              onSaved: (value) {
                                weight = value;
                              },
                            ),
                          ),
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
                                hintText: 'Height',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your height";
                                } //else if (loading == false) {
                                //   return "Name already exists";
                                // }
                                return null;
                              },
                              onSaved: (value) {
                                height = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
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
                                hintText: 'Date Of Birth',
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
                                date = value;
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
              height: 22,
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
                        _registerUser();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Goals();
                      }));
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
                          "Next",
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
    );
  }
}
