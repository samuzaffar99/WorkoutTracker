import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_goals.dart';
//import '../src/user.dart';
import '../src/model.dart';
import '../src/api.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:crypt/crypt.dart';

class DetailsPage extends StatefulWidget {
  String username;
  String password;
  String email;
  final Api _api = Api();
  DetailsPage(this.username, this.password, this.email);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String gender;
  String weight;
  String height;
  String date;

  var _formKey = GlobalKey<FormState>();

  void _registerUser()
  {
    User useree = User.fromJson(
      {
        'username': widget.username,
        'password': Crypt.sha512(widget.password).toString(),
        'email': widget.email,
        'gender': gender,
        'birthdate': date,
        'stats': {'height':height, 'weight':weight},
        "goals": {
          "targetdate": "12/12/2001",
          "weight": "60",
          "bodyfat": "24"
        },
        "workoutplan": {
          "days": {
            "Mon": "true",
            "Tue": "true",
            "Wed": "true",
            "Thu": "true",
            "Fri": "true",
            "Sat": "false",
            "Sun": "false"
          },
          "exercisetype": {
            "homeexercise": "true",
            "powerlifting": "false",
            "bodybuilding": "false"
          }
        },
        "dietplan": {
          "fat": "12",
          "protein": "12",
          "carbs": "12"
        }
      }
    );
      widget._api.postUser(useree).then(
        (value) {
          print('${value.username} is now registered');
        },
      );
      return;
  }


  String selectGender;
  DateTime selectedDate;
  var myFormat = DateFormat('dd/MM/yyyy');
  var myController;

  List<DropdownMenuItem<String>> genderDropdown() {
    List<String> ddl = ["Male", "Female", "Others"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    setState(() {
      myController=TextEditingController(
          text: '${myFormat.format(selectedDate)}');
    });
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
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              value: selectGender,
                              items: genderDropdown(),
                              validator: (value) => value == null
                                  ? 'Please select your gender'
                                  : null,
                              onChanged: (value) {
                                selectGender = value;
                                setState(() {
                                  gender = value;
                                });
                              },
                              hint: Text("Gender"),
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
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: 'Weight (kg)',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your weight";
                                }
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
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: 'Height (cm)',
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your height";
                                }
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
                            child: InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: IgnorePointer(
                                child: TextFormField(
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: 'Date of Birth',
                                    filled: true,
                                    fillColor: Colors.white.withAlpha(200),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter your date of birth";
                                    }
                                    return null;
                                  },
                                  controller: myController,
                                ),
                              ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WorkoutGoals();
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
