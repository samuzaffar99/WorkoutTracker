import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/api.dart';
import 'src/model.dart';

class SignUp extends StatefulWidget {
  final Api _api = Api();
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name;
  String password;
  //bool loading = false;
  var _formKey = GlobalKey<FormState>();

  List drivers = [];
  String fetch;

  void _registerUser() {
    // print("inside regerster user");
    Driver newDriver = Driver.fromJson({'name': name, 'password': password});
    //print('...${newDriver.name}');
    widget._api.postDriver(newDriver).then(
      (value) {
        print('Inside Register User $value');
      },
    );
    return;
  }

  final controllerUN = TextEditingController();
  final controllerPW = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerUN.dispose();
    controllerPW.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_loadDriver();
    // widget._api.getDrivers().then((value) {
    //   drivers = value;
    //   for (int i = 0; i < drivers.length; i++) {
    //     print('${drivers[i].name} ${drivers[i].password}');
    //   }
    // });
  }

  void _loadDriver([bool showSpinner = false]) {
    widget._api.getDrivers(name).then((data) {
      //print(data.name);
      // fetch = data.name;
      // setState(() {
      //   fetch = data.name;
      //   loading = false;
      // });
    });
    // if (showSpinner) {
    //   //print('$fetch');
    //   // for (int i = 0; i < drivers.length; i++) {
    //   //   print('${fetch.name} ${fetch.password}');
    //   //   if (name == fetch.name) {
    //   //     // print('${drivers[i].name} ${drivers[i].password}');
    //   setState(() {
    //     loading = true;
    //   });
    //   //   }
    //   // }
    //   if (loading == false) {
    //     print('User Not Found!');

    //     // setState(() {
    //     //   SignUp();
    //     // });
    //   }
    // }
  }

  Widget trySignIn() {
    return FutureBuilder(
        future: widget._api.getDrivers(controllerUN.text),
        builder: (buildContext, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            throw snapshot.error;
          else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.data.name == controllerUN.text) {
            return Container(
              child: Center(
                child: Text("Correct User"),
              ),
            );
          } else if (snapshot.data.name == null) {
            return Container(
              child: Center(
                child: Text("Wrong User"),
              ),
            );
          }
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       width: double.infinity,
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               decoration: InputDecoration(labelText: "Name"),
  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return "Invalid Name";
  //                 }
  //                 return null;
  //               },
  //               onSaved: (value) {
  //                 name = value;
  //               },
  //             ),
  //             RaisedButton(
  //               onPressed: () {
  //                 if (_formKey.currentState.validate()) {
  //                   _formKey.currentState.save();
  //                   _registerUser();
  //                   //print("$name");
  //                 }
  //               },
  //             )
  //           ],
  //         ),
  //       )
  //     );
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
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
                    child: Column(children: [
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Invalid Name";
                                } //else if (loading == false) {
                                //   return "Name already exists";
                                // }
                                return null;
                              },
                              onSaved: (value) {
                                name = value;
                              },
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Invalid Password";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                password = value;
                                //print(' Golden Value $value');
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlineButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                _loadDriver(true);
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return trySignIn();
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
                                color: Colors.grey.withAlpha(200), width: 1.25),
                            highlightedBorderColor: Colors.grey,
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withAlpha(230),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlineButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                _registerUser();
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return SignUpPage();
                              //     },
                              //   ),
                              // );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            color: Colors.transparent,
                            textColor: Colors.white,
                            borderSide: BorderSide(
                                color: Colors.grey.withAlpha(200), width: 1.25),
                            highlightedBorderColor: Colors.grey,
                            child: Text(
                              "Sign up instead",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withAlpha(230),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
